#!/bin/bash
case $1 in
  run )
    docker run -d \
      -p 8080:8080 \
      -v jenkins:/root/.jenkins \
      -v androidsdk:/opt/android-sdk-linux/licenses \
      -v ssh:/etc/ssh \
      --name=jenkins \
      chamunks/jenkins-android:golang
    ;;
  build )
    docker build -t jenkins-android:golang .
    ;;
  etc )
    docker cp ./resources/moduli jenkins:/etc/ssh/moduli
    docker cp ./resources/ssh_config jenkins:/etc/ssh/ssh_config
    docker cp ./resources/android-sdk-license jenkins:/opt/android-sdk-linux/licenses/android-sdk-license
    docker cp ./resources/id_ed25519 jenkins:/root/.ssh/id_ed25519
    ;;
  rm )
    docker rm -f jenkins
    ;;
  rmi )
    docker rmi -f jenkins
    ;;
  rmv )
    docker volume rm $2
    ;;
  cv )
    docker volume create --name $2
    ;;
  rmva )
    docker volume rm jenkins androidsdk
    ;;
  exec )
    docker exec -ti jenkins /bin/bash
    ;;
  * )
    echo " you done goofed "
    ;;
esac
