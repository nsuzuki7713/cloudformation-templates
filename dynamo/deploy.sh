#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
TEMPLATE_FILE=$SCRIPT_DIR/template.yaml
STACK_NAME=dynamo-sample-stack

aws cloudformation deploy \
  --template-file $TEMPLATE_FILE \
  --stack-name $STACK_NAME