#!/bin/bash -ex

# since the workspace is maintained throughout the build,
# install dependencies now in a clear workspace
rm -rf node_modules dist
npm install

if [ -n "$AWS_DEFAULT_REGION" ]; then
    echo "export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" > environment.sh
else
    echo "export AWS_DEFAULT_REGION=us-east-1" > environment.sh
fi
echo "export dromedary_s3_bucket=$DROMEDARY_S3_BUCKET" >> environment.sh
echo "export dromedary_vpc_stack_name=$DROMEDARY_VPC_STACK" >> environment.sh
echo "export dromedary_iam_stack_name=$DROMEDARY_IAM_STACK" >> environment.sh
echo "export dromedary_ec2_key=$DROMEDARY_EC2_KEY" >> environment.sh
