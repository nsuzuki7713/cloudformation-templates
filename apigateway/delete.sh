#!/bin/bash
STACK_NAME=api-sample-stack

aws cloudformation delete-stack --stack-name $STACK_NAME