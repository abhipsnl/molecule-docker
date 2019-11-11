FROM ubuntu:16.04

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

MAINTAINER Abhishek Sharma ( Senior DevOps Engineer )

RUN apt-get update \
    && apt-get install -y python3 python3-dev gcc libffi-dev libssl-dev libpng-dev g++ python3-pip git sudo iptables vim

RUN apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
       $(lsb_release -cs) \
       stable" && \
    apt-get update && \
    apt-get -y install docker-ce \
    && sudo groupadd docker ; exit 0 \
    && sudo usermod -aG docker root

RUN pip3 install molecule docker 


CMD ["/bin/bash"]
