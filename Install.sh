#!/bin/bash

  [[ "$EUID" -ne 0 ]] && echo "Please, run this as root" && exit 1
  
  fun_bar () {
  
  command[0]="$1"
  command[1]="$2"
  (
  [[ -e $HOME/end ]] && rm $HOME/end
  ${command[0]} -y > /dev/null 2>&1
  ${command[1]} -y > /dev/null 2>&1
  touch $HOME/end
  ) > /dev/null 2>&1 &
while true; do
	for ((i = 0; i < 20; i++)); do
  echo -ne "\033[1;31m#"
  sleep 0.1
done
  [[ -e $HOME/end ]] && rm $HOME/end && break
  echo -e "\033[1;31m#"
  sleep 1
  tput cuu1
  tput dl1
done
}

  fun_bar 'apt-get update' 'apt-get upgrade'
  fun_bar 'apt-get install build-essential' 'apt-get install figlet'
  
  clear
  echo -e "\033[1;36m////////////////////////////////////////////////////////////"
  figlet FreqBot
  echo -e "\033[1;36m////////////////////////////////////////////////////////////"
  echo ""
  echo ""


# Python

  apt-get install software-properties-common
  add-apt-repository ppa:deadsnakes/ppa
  apt-get update
  apt-get install python3.8

# install packages

  apt install -y python3-pip python3-venv python3-dev python3-pandas git screen

# Download `develop` branch of freqtrade repository

  git clone https://github.com/freqtrade/freqtrade.git

  cd freqtrade
  ./setup.sh -i
