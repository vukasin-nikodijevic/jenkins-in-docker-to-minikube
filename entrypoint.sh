#!/bin/bash
set -e

# copy config files on start as homedir is not static - can be mounted to host dir or volume.
# those files can't be added in homedir during build time
cp -a /.kube "${HOME}"

kubectx minikube

# Needed in order to install tiller into minikube if doesn't exists already
[[ ! -d /var/jenkins_home/.helm ]] && helm init

/sbin/tini -- /usr/local/bin/jenkins.sh

exec "$@"
