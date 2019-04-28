#!/bin/bash

# this script generates a random password for each user specified on the command line.

# display what the user typed on the command line
# echo "You executed this command ${0}"

###
# $0 -> first argument
# $1 -> second argument
# ...
# $n -> nth argument
###

# display path and filename of script
echo "you used $(dirname ${0}) as the path to the $(basename ${0}) script."

# how many args were supplied
PARAM_COUNT="${#}"
echo "you passed ${PARAM_COUNT} arguments on the command line"

if [[ "${PARAM_COUNT}" -lt 1 ]]; then
  echo "Usage: ${0} USER_NAME [USER_NAME]...."
  exit 1
fi

for USER in "${@}"; do
  PASSWD=$(source ./gen-passwd.sh)
  echo "${USER}: ${PASSWD}"
done

exit 0