#!/bin/bash

# this script generates a list of random passwords

# A Random number as a password
# PASSWORD=${RANDOM}
# echo "${PASSWORD}"

# three random nums stacked together
# TRIPLES="${RANDOM}${RANDOM}${RANDOM}"
# echo "${TRIPLES}"

# the current date/time as an Unix Epoch
TIMESTAMP=$(date +%s%N)
#echo "${TIMESTAMP}"

# timestamp / random number hash
TOUGHER_PASS=$(echo "$((${RANDOM} * ${TIMESTAMP}))" | sha256sum | head -c 32)
#echo "${TOUGHER_PASS}"

# append a special character
SPECIAL_CHAR=$(echo '!@#$%^&*()_-+=' | fold -w1 | shuf | head -c1)
echo "${TOUGHER_PASS}${SPECIAL_CHAR}"