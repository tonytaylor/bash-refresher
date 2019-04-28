#!/bin/bash

# displays information to the screen.

# echo is a shell builtin
# `type -a echo`
# `help echo`
echo 'hello'

# assign a value to a variable (no space between variable name and 
# equal sign or variable value and equal sign).
WORD='butta'

# single quotes prevent expansion of variables.
echo '${WORD} is printed literally.'

# double quotes expand vars.
echo "This script is so ${WORD}"
echo "$WORD and bread"
