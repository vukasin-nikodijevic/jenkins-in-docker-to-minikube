#!/bin/bash

docker stop $(docker ps --filter "ancestor=development/jenkins:latest" -q)