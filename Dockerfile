FROM ubuntu:14.04

RUN apt-get update && \
  apt-get install -y git wget curl openssl && \
  apt-get clean

WORKDIR /opt

RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.0.6/bin/linux/amd64/kubectl && \
  chmod +x kubectl && \
  mv kubectl /usr/local/bin/

RUN wget https://github.com/digitalocean/doctl/releases/download/0.0.16/linux-amd64-doctl.tar.bz2 && \
  tar xvf linux-amd64-doctl.tar.bz2 && \
  rm linux-amd64-doctl.tar.bz2 && \
  chmod +x doctl && \
  mv doctl /usr/local/bin/

RUN wget https://raw.githubusercontent.com/tests-always-included/mo/master/mo && \
  chmod +x mo && \
  mv mo /usr/local/bin/

ADD digitalocean /opt/digitalocean

CMD bash