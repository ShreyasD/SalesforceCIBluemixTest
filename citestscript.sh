#!/bin/bash

cf login -a https://api.ng.bluemix.net -u sdhond@ca.ibm.com -p Shredderin1989
PIPELINEID="b5d9fc4a-dbb6-4ed8-a795-2a3c29d715f7"
TOKEN="$(cf oauth-token)"
echo "Authorization Header: ${TOKEN}"
STAGEID=$(curl -H "Authorization:${TOKEN}" https://devops-api.ng.bluemix.net/v1/pipeline/pipelines/${PIPELINEID}/stages | python -c "import sys, json; print json.load(sys.stdin)[0]['id']")
echo "Stage: ${STAGEID}"
echo $(curl -X POST -H "Authorization:${TOKEN}" https://devops-api.ng.bluemix.net/v1/pipeline/pipelines/${PIPELINEID}/stages/${STAGEID}/executions)
