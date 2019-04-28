#!/bin/bash

#Display the UID
echo "user id is ${UID}"

# Only display if UID isn't 1000
UID_TO_TEST_FOR='1000'

if [[ "${UID}" -ne ${UID_TO_TEST_FOR} ]]; then
  echo "your uid doesn't match ${UID_TO_TEST_FOR}"
  exit 1
fi

# Display the username
USER_NAME=$(id -un)

# Test if the command succeeds (most recently executed command exit status)
if [[ "${?}" -ne 0 ]]; then
  echo 'the id command did not execute successfully'
  exit 1
fi
echo "your username is ${USER_NAME}."

# you can use a string test conditional
TARGET_USER_NAME='vagrant'

# single equal sign (exact match); double equal sign (pattern match)
if [[ "${USER_NAME}" = "${TARGET_USER_NAME}" ]]; then
  echo "your username matches ${TARGET_USER_NAME}"
fi

# test for inequality
if [[ "${USER_NAME}" != "${TARGET_USER_NAME}" ]]; then
  echo "your username doesn't match ${TARGET_USER_NAME}"
fi

exit 0