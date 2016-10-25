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
		- [Pull](#pull)
		- [Basic Run](#basic-run)
	- [Advanced Usage](#advanced-usage)
	- [Caveats](#caveats)

<!-- /TOC -->
____
## Current Status
**INCOMPLETE / TESTING**

## ToDo
- ~~Upgrade OS~~
- ~~Flatten layers~~
- ~~Get building on 16.04~~
- ~~Upgrade Packages~~
- ~~Get building with latest packages~~
- ~~Add persistence (volumes)~~
- ~~Write some stuff about docker volumes and usage and such.~~

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
### Pull

``$ docker pull chamunks/jenkins-android``

### Basic Run

``$ docker run -d -p 8080:8080 chamunks/jenkins-android``

## Advanced Usage

``docker volume create --name jenkins``

``docker run -d -p 8080:8080 -v jenkins:/root/.jenkins --name=jenkins chamunks/jenkins-android-test``

Do note that when you use the advanced usage noted above you will have created a specific volume that will persist through one ``docker rm -f jenkins`` to the next so if you make your own fork of this and maintain it you will be able to upgrade it with your data in tact.

## Caveats
This container may or may not be maintained by me, you're welcomed to submit PR/MR's and I will review/merge them because theres no real sense in maintaining 20 copies of this.  That said I tend to make things once and then use them for a while and then stop maintaining them personally.

The ``docker volume create`` method leaves a dangling volume if you do not execute the command ``docker volume rm jenkins`` after you're finished.  This volume may grow to be fairly large if you're archiving your artifacts.
