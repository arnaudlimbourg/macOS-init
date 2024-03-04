#!/bin/bash -xe

QUERIED_RELEASE="emr-5.29.0"
REGION="eu-west-1"
LIST_CLUSTERS_COMMAND="aws emr list-clusters --region $REGION"
COUNTER=0

function CALL_API() {
  if [ ! -v NEXT_TOKEN ]; then
    CLI_OUTPUT=$($LIST_CLUSTERS_COMMAND)
  else
    CLI_OUTPUT=$($LIST_CLUSTERS_COMMAND --starting-token $NEXT_TOKEN)
  fi

  CLUSTER_IDS=`echo $CLI_OUTPUT | jq -r ".Clusters[].Id" | xargs`
  for CLUSTER_ID in $CLUSTER_IDS; do
    CLUSTER_DETAILS=`aws emr describe-cluster --region $REGION --cluster-id $CLUSTER_ID`
    STATE=`echo $CLUSTER_DETAILS | jq -r ".Cluster.Status.State"`
    CREATION_TIME=`echo $CLUSTER_DETAILS | jq -r ".Cluster.Status.Timeline.CreationDateTime" | cut -f1 -d "."`
    RELEASE_LABEL=`echo $CLUSTER_DETAILS | jq -r ".Cluster.ReleaseLabel"`
    echo "Cluster $CLUSTER_ID, release label $RELEASE_LABEL, created on $CREATION_TIME, current state: $STATE"
    if [ "$RELEASE_LABEL" = "$QUERIED_RELEASE" ]; then
      let COUNTER=COUNTER+1
    fi
  done
  NEXT_TOKEN=`echo $CLI_OUTPUT | jq -r ".NextToken"`
  while [ "$NEXT_TOKEN" != "null" ]; do
    CALL_API
  done
}

CALL_API
echo "Total clusters created with release label $QUERIED_RELEASE are $COUNTER"
