#!/bin/bash

# enforce that it be executed with root privileges
# if a script is not executed with superuser privileges, it 
# will not attempt to create a user and returns an exit
# status of 1
if [[ "${EUID}" -ne 0 ]]; then
  echo 'This script must be run as root' >&2
  exit 1
fi

# provide a usage statement much like you would find in a man
# page if the user does not supply an account name on the command
# line and returns and exit status of 1.
if [[ "${#}" -lt 1 ]]; then
  echo "Usage: ${0} USER_NAME [COMMENT]. . ." >&2
  exit 1
fi

# automatically generates a password for the account
PASS_WORD=$(source ./gen-passwd.sh)

# use the first argument provided on the command line as the username
# for the account. Any remaining arguments on the command-line will be
# treated as the comment for the account.
USER_NAME="${1}"
shift
COMMENT="${@}"
$(useradd -c "${COMMENT}" -m ${USER_NAME}) &> /dev/null

# inform the user if the account was not able to be created for some reason
# if the account is not created, the script is to return an exit status of 1.
if [[ "${?}" -ne 0 ]]; then
  echo "the account could not be created." >&2
  exit 1
fi

# display the username, password and host where the account was created.
# this way the help desk staff can copy the output of the script in order
# to easily deliver the information to the new account holder.
# assign password
#PASSWORD_=$(source ./gen-passwd.sh)
echo "${PASS_WORD}" |  passwd --stdin ${USER_NAME} &> /dev/null

# force password change on first login
passwd -e ${USER_NAME} &> /dev/null

if [[ "${?}" -eq 0 ]]; then
  echo "username: ${USER_NAME}"
  echo "password: ${PASS_WORD}"
  echo "host: ${HOSTNAME}"
  exit 0
else
  echo "the password for user ${USER_NAME} was not created successfully." >&2
  exit 1
fi

exit 0