#!/bin/bash

docker_runtime_path=${HOME}/docker
if ! $(grep -q ${docker_runtime_path} /etc/default/docker); then
  echo "Configuring docker to use ${docker_runtime_path} as the graph path"
  mkdir -p $docker_runtime_path
  echo "DOCKER_OPTS='-g ${docker_runtime_path}'" | sudo tee -a /etc/default/docker
  sudo service docker restart
else
  echo 'Skipping docker graph path config'
fi

# Add the docker group
sudo groupadd docker
sudo gpasswd -a ${USER} docker

# docker-compose
curl -L https://github.com/docker/compose/releases/download/1.3.2/docker-compose-`uname -s`-`uname -m` > $HOME/bin/docker-compose
chmod +x $HOME/bin/docker-compose

curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose --version | awk 'NR==1{print $NF}')/contrib/completion/bash/docker-compose \
  | sudo tee /etc/bash_completion.d/docker-compose
