#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
TEMPLATE_FILE=$SCRIPT_DIR/template.yaml
STACK_NAME=lambda-sample-stack

aws cloudformation package \
    --template-file $TEMPLATE_FILE \
    --s3-bucket athena-test-7010 \
    --output-template-file packaged-template.yaml

aws cloudformation deploy \
    --template-file packaged-template.yaml \
    --stack-name $STACK_NAME \
    --capabilities CAPABILITY_IAM
