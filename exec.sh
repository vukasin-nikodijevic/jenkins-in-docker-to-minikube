#!/bin/bash

docker exec \
-it $(docker ps --filter "ancestor=development/jenkins:latest" -q) \
bash