#!/bin/bash

command="echo Hello from bashland!!"

if [ -n "$1" ];then
  command="echo Hello $1!!"
fi

eval $command