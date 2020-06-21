#!/bin/bash

show_help(){
  echo "NEX Deployment needs prefix"
  echo "Usage: "
  echo "      devops/nex-undeploy.sh [-p] [-s] [-x] appname ... where:"
  echo "      -p means production backing service else dev plan"
  echo "         eg: devops/pmc-undeploy.sh appname"
}

# ensure app-prefix is pass in
if [ $# -lt 1 ] ; then
  show_help
  exit 1
fi

PREFIX=$1
echo "Using prefix: $PREFIX"

PREFIX=$1
cf delete-service -f ${PREFIX}-rabbitmq
cf delete-service -f ${PREFIX}-postgres
cf delete-service -f ${PREFIX}-redis
