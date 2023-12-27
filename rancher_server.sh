#!/bin/bash
#instalacao do docker, docker compose, e adaptacao para rancher server

sudo apt-get update

if [ $? -eq 0 ]; then echo "sucesso passou o update"; else exit 1; fi

sudo apt-get install curl -y

if [ $? -eq 0 ]; then echo "sucesso passou o a instalação do curl"; else exit 1; fi


sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

if [ $? -eq 0 ]; then echo "sucesso passou o curl"; else exit 1; fi

sudo chmod +x /usr/local/bin/docker-compose

if [ $? -eq 0 ]; then echo "sucesso passou o chmod"; else exit 1; fi

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

if [ $? -eq 0 ]; then echo "sucesso passou o link simbolico"; else exit 1; fi

docker-compose -v

if [ $? -eq 0 ]; then echo "sucesso passou o docker-compose -v"; else exit 1; fi

sudo apt-get install docker.io -y

if [ $? -eq 0 ]; then echo "sucesso passou a instalacao do docker"; else exit 1; fi

docker -v

if [ $? -eq 0 ]; then echo "sucesso passou a instalacao do docker"; else exit 1; fi

systemctl start docker

if [ $? -eq 0 ]; then echo "sucesso passou o systemctl start docker"; else exit 1; fi

docker ps 

if [ $? -eq 0 ]; then echo "sucesso passou o docker ps"; else exit 1; fi

#subindo o rancher server
docker run -d --name rancher --restart=unless-stopped --privileged -v /var/lib/ -p 80:80 -p 443:443 rancher/rancher:stable

if [ $? -eq 0 ]; then echo "sucesso passou subir rancher server"; else exit 1; fi

#instalando o kubctl
apt-get update

if [ $? -eq 0 ]; then echo "sucesso passou o apt-get update"; else exit 1; fi

apt-get install -f apt-transport-https gnupg2 -y

if [ $? -eq 0 ]; then echo "sucesso passou a instalacao apt-transport-https gnupg2"; else exit 1; fi

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

if [ $? -eq 0 ]; then echo "sucesso passou o curl"; else exit 1; fi

echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

if [ $? -eq 0 ]; then echo "sucesso passou add list repositorio k8s"; else exit 1; fi

apt-get update

if [ $? -eq 0 ]; then echo "sucesso passou o apt-get update"; else exit 1; fi

apt-get install kubectl -y

if [ $? -eq 0 ]; then echo "sucesso passou a instalacao do k8s kbctl"; else exit 1; fi

#configuracao kubctl
mkdir /root/.kube/

if [ $? -eq 0 ]; then echo "sucesso passou a criacao do diretorio .kube"; else exit 1; fi

touch /root/.kube/config

if [ $? -eq 0 ]; then echo "sucesso passou a criacao do config"; else exit 1; fi
