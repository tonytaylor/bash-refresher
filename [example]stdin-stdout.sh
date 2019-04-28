#!/bin/bash

# this script demonstrates i/o redirection

# redirect STDOUT to a file
FILE='/tmp/data'
head -n1 /etc/passwd > ${FILE}

# redirect STDIN to a program
read LINE < ${FILE}
echo "LINE contains ${LINE}"

# redirect STDOUT to a file, overwriting the file if exists
head -n3 /etc/passwd > ${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

# redirect STDOUT to a file, appending to the file if exists
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

# redirect STDIN to a program, using FD-0
read LINE 0< ${FILE}
echo 
echo "LINE contains: ${LINE}"

# redirect STDOUT to a file using FD 1, overwriting the file
head -n3 /etc/passwd 1> ${FILE}
echo
echo "Contents of ${FILE}"
cat ${FILE}



# redirect STDERR to a file using FD-2
ERR_FILE="/tmp/data.err"
head -n3 /etc/passwd /nofile 2> ${ERR_FILE}

# redirect STDOUT and STDERR to a file
head -n3 /etc/passwd /nofile &> ${FILE}
echo
echo "Contents of ${FILE}"
cat ${FILE}

# redirect STDOUT and STDERR through a pipe
echo
head -n3 /etc/passwd /nofile |& cat -n

# send output to STDERR
echo
echo "error" >&2 | cat -n
echo "This is STDERR" >&2

# the null device (bitbucket) -> /dev/null
# discard STDOUT
echo
echo "Discarding STDOUT"
head -n3 /etc/passwd /nofile > /dev/null

# discard STDERR
echo
echo "Discarding STDERR"
head -n3 /etc/passwd /nofile 2> /dev/null

# discard STDOUT and STDERR
echo
echo "Discarding STDOUT and STDERR"
head -n3 /etc/passwd /nofile &> /dev/null

# clean up
rm ${FILE} ${ERR_FILE} 2? /dev/null