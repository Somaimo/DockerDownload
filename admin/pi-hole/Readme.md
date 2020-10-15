# Pihole with Docker

This spins up a pihole docker container and connects the config files (either new or from a backup).

## Requirements

- Docker
- Docker Compose

### Install Docker and Docker Compose on Raspi (ubuntu lts)

1. Install Docker ```curl -sSL https://get.docker.com | sh```
2. Install Docker-Compose requirements ```sudo apt-get install -y libffi-dev libssl-dev python3-pip```
3. Install Docker-Compose with pip3 ```sudo pip3 install docker-compose
