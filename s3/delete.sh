#!/bin/bash
STACK_NAME=s3-sample-stack

aws cloudformation delete-stack --stack-name $STACK_NAME