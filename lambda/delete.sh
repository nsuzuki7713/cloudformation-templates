#!/bin/bash
STACK_NAME=lambda-sample-stack

aws cloudformation delete-stack --stack-name $STACK_NAME