# Jenkins Android

## Description
This container aims to be one that allows someone to get started compiling APK's out of the box.  More of a description to come.

## ToC
<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Jenkins Android](#jenkins-android)
	- [Description](#description)
	- [ToC](#toc)
	- [Current Status](#current-status)
	- [ToDo](#todo)
	- [Health & Statistics](#health-statistics)
		- [Repository Health](#repository-health)
		- [Container Build Health](#container-build-health)
		- [Repository Statistics/Info](#repository-statisticsinfo)
	- [Usage](#usage)

<!-- /TOC -->
____
## Current Status
**INCOMPLETE / TESTING**

## ToDo
- Upgrade OS
- Flatten layers
- Get building on 16.04
- Upgrade Packages
- Get building with latest packages.
- ~~Add persistence (volumes)~~

## Health & Statistics
### Repository Health
[![GitHub issues](https://img.shields.io/github/issues/chamunks/jenkins-android.svg?style=flat-square)](https://github.com/chamunks/jenkins-android) out of [![GitHub total issues](https://img.shields.io/github/issues-raw/chamunks/jenkins-android.svg?style=flat-square)](https://github.com/chamunks/jenkins-android)

### Container Build Health
[![Docker Pulls](https://img.shields.io/docker/pulls/chamunks/jenkins-android.svg?style=flat-square)](https://registry.hub.docker.com/u/chamunks/jenkins-android/)
[![Docker Stars](https://img.shields.io/docker/stars/chamunks/jenkins-android.svg?style=flat-square)](https://registry.hub.docker.com/u/chamunks/jenkins-android/)
[![Docker Build Status](http://hubstatus.container42.com/chamunks/jenkins-android)](https://registry.hub.docker.com/u/chamunks/jenkins-android)

### Repository Statistics/Info
[![GitHub license](https://img.shields.io/github/license/chamunks/jenkins-android.svg?style=flat-square)](https://github.com/chamunks/jenkins-android)

[![GitHub forks](https://img.shields.io/github/forks/chamunks/jenkins-android.svg?style=flat-square)](https://github.com/chamunks/jenkins-android)
[![GitHub stars](https://img.shields.io/github/stars/chamunks/jenkins-android.svg?style=flat-square)](https://github.com/chamunks/jenkins-android)

___

## Usage
*Pull*

``$ docker pull chamunks/jenkins-android``

*Usage*

``$ docker run -d -p 8080:8080 chamunks/jenkins-android``
