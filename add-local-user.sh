#!/bin/bash

# this script creates an account on the local system
# you will be prompted for the account name and password

if [[ "${EUID}" -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi


# ask for username
read -p 'Please enter the name for this account: ' USERNAME_

# ask for the full name
read -p 'Please enter the full name for this account: ' COMMENT_

# ask for the password
read -p 'Please enter the password: ' PASSWORD_

# create user
useradd -c "${COMMENT_}" -m ${USERNAME_}

if [[ "${?}" -ne 0 ]]; then
  echo "the account could not be created."
  exit 1
fi

# assign password
#PASSWORD_=$(source ./gen-passwd.sh)
echo "${PASSWORD_}" |  passwd --stdin ${USERNAME_}

# force password change on first login
passwd -e ${USERNAME_}

if [[ "${?}" -eq 0 ]]; then
  echo
  echo "username: ${USERNAME_}"
  echo "password: ${PASSWORD_}"
  echo "host: ${HOSTNAME}"
  exit 0
else
  echo "the password for user ${USERNAME_} was not created successfully."
  exit 1
fi

