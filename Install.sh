#!/bin/bash

  [[ "$EUID" -ne 0 ]] && echo "Please, run this as root" && exit 1

  apt-get update && apt-get upgrade -y
  apt-get install build-essential -y

# Python

  apt-get install software-properties-common
  add-apt-repository ppa:deadsnakes/ppa
  apt-get update
  apt-get install python3.8

# install packages

  apt install -y python3-pip python3-venv python3-dev python3-pandas git

# Download `develop` branch of freqtrade repository

  git clone https://github.com/freqtrade/freqtrade.git

  cd freqtrade
  ./setup.sh -i
  source ./.env/bin/activate
