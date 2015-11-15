FROM ubuntu:14.04

RUN apt-get update && \
  apt-get install -y git wget curl openssl && \
  apt-get clean

WORKDIR /opt/gen-certs

RUN git clone https://github.com/tests-always-included/mo && mv mo/mo /usr/bin/mo && rm -rf mo

ADD openssl.cnf.mo /opt/gen-certs/
ADD gen-certs.sh /opt/gen-certs/

CMD ["/opt/gen-certs/gen-certs.sh"]
