###################################
# Dockerfile for jenkins-android ##
# Based on Ubuntu                ##
###################################

# Set the base image to Ubuntu
FROM ubuntu:16.04
MAINTAINER Chamunks <Chamunks@gmail.com>

# Never ask for confirmations
ENV DEBIAN_FRONTEND noninteractive
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | /usr/bin/debconf-set-selections && \
    echo "debconf shared/accepted-oracle-license-v1-1 seen true" | /usr/bin/debconf-set-selections

# Add oracle-jdk6 packages to and from apt.
RUN apt-get update && \
    apt-get install software-properties-common python-software-properties -y && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update && \
    apt-get install oracle-java8-installer -y && \
    apt-get install oracle-java8-set-default -y && \
    apt-get install -y unzip -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y
    # apt-get install libfuse2 -y && \

ENV JAVA_HOME /usr/bin/java
ENV PATH $JAVA_HOME:$PATH

# Add Android SDK
RUN wget --progress=dot:giga http://dl.google.com/android/android-sdk_r22.6.2-linux.tgz && \
    mv android-sdk_r22.6.2-linux.tgz /opt/ && \
    cd /opt && tar xzvf ./android-sdk_r22.6.2-linux.tgz && \
    rm -r /opt/android-sdk_r22.6.2-linux.tgz
ENV ANDROID_HOME /opt/android-sdk-linux/
ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
RUN echo $PATH && \
    echo "y" | android update sdk -u --filter platform-tools,android-19,build-tools-19.0.3 && \
    chmod -R 755 $ANDROID_HOME

ADD https://services.gradle.org/distributions/gradle-0.9-bin.zip /opt/
RUN unzip /opt/gradle-0.9-bin.zip -d /opt && \
    rm /opt/gradle-0.9-bin.zip
ENV GRADLE_HOME /opt/gradle-0.9
ENV PATH $GRADLE_HOME/bin:$PATH

# Fake a fuse install (to prevent ia32-libs-multiarch package from producing errors)
# RUN cd /tmp ; apt-get download fuse && \
#     cd /tmp ; dpkg-deb -x fuse_* . && \
#     cd /tmp ; dpkg-deb -e fuse_* && \
#     cd /tmp ; rm fuse_*.deb && \
#     cd /tmp ; echo -en '#!/bin/bash\nexit 0\n' > DEBIAN/postinst && \
#     cd /tmp ; dpkg-deb -b . /fuse.deb && \
#     cd /tmp ; dpkg -i /fuse.deb && \
#     apt-get install -y ia32-libs-multiarch && \
#     apt-get autoclean -y && \
#     apt-get autoremove -y

# Add git
RUN apt-get install -y git-core && \
    apt-get autoclean -y && \
    apt-get autoremove -y

# Add Jenkins
# Thanks to orchardup/jenkins Dockerfile
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - && \
    echo "deb http://pkg.jenkins-ci.org/debian-stable binary/" >> /etc/apt/sources.list && \
    apt-get update && \
    mkdir /var/run/jenkins && \
    apt-get install -y jenkins && \
    service jenkins stop
EXPOSE 8080
VOLUME ["/var/lib/jenkins"]
ENTRYPOINT [ "java","-jar","/usr/share/jenkins/jenkins.war" ]
