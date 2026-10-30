#!/bin/bash

echo "Triggering Pipeline Job..."
echo "========================================"
echo "       JENKINS ENVIRONMENT VARIABLES"
echo "========================================"

echo "JENKINS_URL       : ${JENKINS_URL:-NOT SET}"
echo "BUILD_URL         : ${BUILD_URL:-NOT SET}"
echo "JOB_NAME          : ${JOB_NAME:-NOT SET}"
echo "BUILD_NUMBER      : ${BUILD_NUMBER:-NOT SET}"
echo "JENKINS_USER      : ${JENKINS_USER:+SET}"
echo "JENKINS_API_TOKEN : ${JENKINS_API_TOKEN:+SET}"

echo "========================================"
JENKINS_BASE_URL="${JENKINS_URL%/}"

if [ -z "$JENKINS_BASE_URL" ]; then
    echo "ERROR: JENKINS_URL is not defined!"
    exit 1
fi

PIPELINE_URL="$JENKINS_BASE_URL/job/Pipeline/buildWithParameters?ENVIRONMENT=SYS"

curl --fail-with-body --silent --show-error \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -X POST \
  -w "\nHTTP Status: %{http_code}\n" \
  "$PIPELINE_URL"

if [ $? -ne 0 ]; then
    echo "Pipeline trigger failed!"
    exit 1
fi

echo "Pipeline triggered successfully!"
