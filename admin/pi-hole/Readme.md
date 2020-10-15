# Pihole with Docker

This spins up a pihole docker container and connects the config files (either new or from a backup).

## Requirements

- Docker
- Docker Compose

### Install general Stuff on Raspi
1. Install ZSH ```sudo apt install zsh```
2. Install Oh-My-ZSH ```sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```
3. Copy Files from other raspy to this raspy

### Install Docker and Docker Compose on Raspi (ubuntu lts)

1. Install Docker ```curl -sSL https://get.docker.com | sh```
2. Install Docker-Compose requirements ```sudo apt-get install -y libffi-dev libssl-dev python3-pip```
3. Install Docker-Compose with pip3 ```sudo pip3 install docker-compose
