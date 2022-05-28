#!/usr/bin/env bash

  [[ "$EUID" -ne 0 ]] && echo "Please, run this as root" && exit 1
  
  cd $HOME
  apt-get update && apt-get upgrade -y
  apt-get -y install build-essential figlet git
  
  clear
  echo "////////////////////////////////////////////////////////////"
  figlet FreqTrade
  echo "////////////////////////////////////////////////////////////"
  echo ""
  echo ""
  sleep 1s

# Python

  apt-get install software-properties-common -y
  add-apt-repository ppa:deadsnakes/ppa
  apt-get update
  apt-get install python3.8 -y

# install packages

  apt-get install -y python3-pip python3-venv python3-dev python3-pandas screen

# Download `develop` branch of freqtrade repository

  git clone https://github.com/freqtrade/freqtrade.git

  cd freqtrade
  ./setup.sh -i
  rm $HOME/Install.sh
