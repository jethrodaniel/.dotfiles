#!/usr/bin/env bash

# Color escape codes
red=`tput setaf 1`
green=`tput setaf 2`
cyan=`tput setaf 6`
reset=`tput sgr0`
bold=`tput bold`

bold_green="${bold}${green}"

# echo a string
#
# @param $1 the string to print
say() {
  echo -e "${bold_green}$1${reset}"
}

# Ask a yes or no question, prompting until a valid response is recieved
#
# @param $1 the question to ask
#
# @return true if 'yes', false if 'no'
ask() {
  until [[ $choice =~ ^(yes|no)$ ]]; do
    read -p "${cyan}$1 (yes/no): ${reset}" choice
  done

  if [[ $choice == 'yes' ]]; then
    unset choice
    true
  else
    unset choice
    false
  fi
}

