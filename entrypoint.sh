#!/bin/bash

SONAR_TOKEN=$1
SONAR_HOST_URL=$2
PROJECT_KEY=$3
REPO_KEY=$4
SQ_DEVOPS_INTEGRATION_NAME=$5

echo "Sonar Host URL being used: $SONAR_HOST_URL"
echo "Project Key being used: $PROJECT_KEY"
echo "Repository Key used: $REPO_KEY"
echo "SonarQube DevOps Integration Name: $SQ_DEVOPS_INTEGRATION_NAME"

# Make the API call to SonarQube
response=$(curl -u $SONAR_TOKEN: -X GET "$SONAR_HOST_URL/api/alm_settings/get_binding?project=$PROJECT_KEY")
echo "response=$response" 
# Save the response to a file
echo "response=$response" > value.txt

# Set the file path as an environment variable
echo "VALUE_FILE=value.txt" >> $GITHUB_ENV

case $response in
    *"is not bound to any DevOps Platform"*)
    echo "The condition was met, adding the alm binding."
    curl -u $SONAR_TOKEN: -X POST "$SONAR_HOST_URL/api/alm_settings/set_github_binding?almSetting=$SQ_DEVOPS_INTEGRATION_NAME&monorepo=false&project=$PROJECT_KEY&repository=$REPO_KEY"
      ;;
    *)
      echo "The condition was not met, so the task was not executed."
      ;;
esac
