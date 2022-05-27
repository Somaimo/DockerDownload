# Pihole with Docker

This spins up a pihole docker container and connects the config files (either new or from a backup).

## Requirements

- Docker
- Disable Systemd-resolved
- Docker Compose

### Install general Stuff on Raspi
1. Install ZSH ```sudo apt install zsh```
2. Install Oh-My-ZSH ```sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```
3. Copy Files from other raspy to this raspy

### Disable Systemd-resolved
1. Set ```DNSStubListener=no``` in /etc/systemd/resolved.conf
2. Set ```DNS=``` in /etc/systemd/resolved.conf to a DNS Server that makes sense.
2. Restart systemd-resolved with ```sudo systemctl restart systemd-resolved.service```
3. Remove /etc/resolv.conf (no worries, it's just a link) and create new link: ```ln -s /var/run/systemd/resolve/resolv.conf /etc/resolv.conf```
4. All Done!

### Install Docker and Docker Compose on Raspi (ubuntu lts)

1. Install Docker ```curl -sSL https://get.docker.com | sh```
2. Install Docker-Compose requirements ```sudo apt-get install -y libffi-dev libssl-dev python3-pip```
3. Install Docker-Compose with pip3 ```sudo pip3 install docker-compose```

# Execute Script

Just execute ```sudo ./initialize.sh``` and you should be golden.
