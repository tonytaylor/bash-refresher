#!/bin/bash

# display the UID and username of script executor
# display if user is root user or not

# display the uid
echo "Your UID is ${UID}."

# display the username
USERNAME=$(id -un)
echo "Your username is ${USERNAME}"

# display superuser status
if [[ "${UID}" -eq 0 ]]; then
  echo 'You root!'
else
  echo 'No root!'
fi