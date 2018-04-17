#!/bin/bash

set -e

echo 'Waiting for Elasticsearch cluster to be available...'
sleep 10

URL="https://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT"
# check that ElasticSearch is running
nc -w 1 $ELASTICSEARCH_HOST $ELASTICSEARCH_PORT 2>/dev/null

if [ $Â != 0]; then
  echo 'Unable to connect to the Elasticsearch cluster.'
  echo 'Exiting DockerBeat...'
  exit -1
fi

echo 'Elasticsearch cluster is available'
echo 'Starting dockerbeat...'
dockerbeat -e -c dockerbeat.yml
