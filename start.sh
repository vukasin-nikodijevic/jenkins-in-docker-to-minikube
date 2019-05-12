#!/bin/bash

docker run --rm \
-p 8080:8080 \
-p 50000:50000 \
-v /home/vukasin/Development/jenkins-data:/var/jenkins_home \
development/jenkins:latest