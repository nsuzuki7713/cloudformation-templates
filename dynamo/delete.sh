#!/bin/bash
STACK_NAME=dynamo-sample-stack

aws cloudformation delete-stack --stack-name $STACK_NAME