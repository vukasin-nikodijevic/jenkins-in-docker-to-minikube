FROM jenkins/jenkins:lts

ARG HOST_HOME_DIR
USER root

RUN apt update && apt install telnet git -y
RUN wget https://storage.googleapis.com/kubernetes-helm/helm-v2.13.1-linux-arm64.tar.gz -O latest.tgz
RUN tar -xzf latest.tgz && mv linux-arm64/helm /usr/bin/helm && rm -rf latest.tgz linux-arm64

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/bin/kubectl
RUN kubectl version --client

# helpers nice to have
RUN git clone https://github.com/ahmetb/kubectx /opt/kubectx
RUN ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
RUN ln -s /opt/kubectx/kubens /usr/local/bin/kubens
RUN chmod +x /usr/local/bin/kubectx /usr/local/bin/kubens

# copy config needed by kubectl and minikube
# host dir must pre preserved as minkube certs path in .kube/config contains it
RUN mkdir -p /.kube "${HOST_HOME_DIR}"
COPY ./.kube /.kube
COPY ./.minikube "${HOST_HOME_DIR}"/.minikube
RUN chown jenkins:jenkins -R /.kube
RUN chown jenkins:jenkins -R "${HOST_HOME_DIR}"

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && chown jenkins:jenkins /entrypoint.sh

USER jenkins

ENTRYPOINT [ "/entrypoint.sh" ]