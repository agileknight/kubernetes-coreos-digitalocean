FROM ubuntu:14.04

RUN apt-get update && \
  apt-get install -y git wget curl openssl && \
  apt-get clean

WORKDIR /opt

RUN ARCH=linux; wget https://storage.googleapis.com/kubernetes-release/release/v1.0.6/bin/${ARCH}/amd64/kubectl && \
  chmod +x kubectl && \
  mv kubectl /usr/local/bin/kubectl

ADD configure-kubectl.sh /opt/

CMD /opt/configure-kubectl.sh; bash