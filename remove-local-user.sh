#!/bin/bash

if [[ "${EUID}" -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# ask for username
read -p 'Please enter the name for this account: ' USERNAME_

userdel --remove ${USERNAME_}

if [[ "${?}" -eq 0 ]]; then
  exit 0
else
  exit 1
fi