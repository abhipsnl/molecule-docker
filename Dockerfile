FROM ubuntu:16.04

MAINTAINER Abhishek Sharma

RUN apt-get update \
    && apt-get install -y python3 python3-dev gcc libpng-dev g++ python-pip git sudo iptables

RUN apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
     curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
     add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
       $(lsb_release -cs) \
       stable" && \
     apt-get update && \
     apt-get -y install docker-ce

RUN pip install molecule docker
RUN sudo groupadd docker ; exit 0 \
    && sudo usermod -aG docker root


CMD service docker start
CMD ["/bin/bash"]
