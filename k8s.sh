#!/bin/bash
#instalacao do docker e docker compose

sudo apt-get update

if [ $? -eq 0 ]; then echo "sucesso passou o update"; else exit 1; fi

sudo apt-get install curl -y

if [ $? -eq 0 ]; then echo "sucesso passou o a instalação do curl"; else exit 1; fi

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

if [ $? -eq 0 ]; then echo "sucesso passou o curl do docker compose"; else exit 1; fi

sudo chmod +x /usr/local/bin/docker-compose

if [ $? -eq 0 ]; then echo "sucesso passou o chmod no arquivo docker-compose"; else exit 1; fi

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
