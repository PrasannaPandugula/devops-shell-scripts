#!/bin/bash

#########################
# Author: Prasanna Pandugula
# Date: 8/19/2025
#
# This scripts outputs the node health
#
# Version: v1
####################


set -x # debug mode
set -e # exit the script when there is an error
set -o pipefail # set -e ignores pipe failures 

df -h

#systeminfo

nproc

ps -ef | grep "bash" | awk -F" " '{$1}'

for i in {1..100}; do echo $i; done

