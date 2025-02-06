#!/bin/bash

command="echo Checking current status of project in SonarQube"
response=$(curl -u $1: -X GET '$2/api/alm_settings/get_binding?project=$3')
echo "response=$response" >> value.txt
echo "value.txt" >> $GITHUB_ENV
#echo "response=$response"


eval $command
