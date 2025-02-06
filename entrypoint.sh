#!/bin/bash

# Check if the required arguments are provided
#if [ "$#" -ne 3 ]; then
#  echo "Usage: $0 <SONAR_TOKEN> <SONAR_HOST_URL> <PROJECT_KEY>"
#  exit 1
#fi

# Check if curl is installed
if ! command -v curl &> /dev/null; then
  echo "curl could not be found, installing..."
  sudo apt-get update && sudo apt-get install -y curl
fi

SONAR_TOKEN=$1
SONAR_HOST_URL=$2
PROJECT_KEY=$3

# Command to check the current status of the project in SonarQube
command="echo Checking current status of project in SonarQube"
eval $command

# Make the API call to SonarQube
response=$(curl -u $SONAR_TOKEN: -X GET "$SONAR_HOST_URL/api/alm_settings/get_binding?project=$PROJECT_KEY")

# Save the response to a file
echo "response=$response" > value.txt

# Set the file path as an environment variable
echo "VALUE_FILE=value.txt" >> $GITHUB_ENV
