#!/bin/bash

# FD-0: STDIN
# FD-1: STDOUT
# FD-2: STDERR

echo "${UID}" 1> uid
# equivalent to
echo "${UID}" > uid

# command has both STDOUT and STDERR sent to the screen
# instead, redirect STDOUT to a file and send STDERR to the screen
head -n1 /etc/passwd /etc/hosts /nofile > head.out

# now direct STDERR to a file and STDOUT to the screen
head -n1 /etc/passwd /etc/hosts /nofile 2> head.err

# directing no output to screen
# errors go to head.err; output to head.out
head -n1 /etc/passwd /etc/hosts /nofile > report.out 2> report.err

# this one is a little complex
# redirects STDOUT and STDERR to file
#
# routes STDERR to STDOUT, where STDOUT has been already redirected to a file
head -n1 /etc/passwd /etc/hosts /nofile > head.both 2>&1

# does the same as above, but much cleaner to read
head -n1 /etc/passwd /etc/hosts /nofile &> head.both

# when working with pipes
# redirecting STDERR to STDOUT to pipe into STDIN of next command
head -n1 /etc/passwd /etc/hosts /nofile 2>&1 | cat -n