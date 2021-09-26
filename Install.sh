#!/bin/bash

sudo apt-get update && apt-get upgrade -y
sudo apt-get install build-essential -y

# Python

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.8

# install packages

sudo apt install -y python3-pip python3-venv python3-dev python3-pandas git

# Download `develop` branch of freqtrade repository

git clone https://github.com/freqtrade/freqtrade.git

cd freqtrade
./setup.sh -i
source ./.env/bin/activate
