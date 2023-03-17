#!/bin/bash

sleep 5
mc alias set theminio http://minio:9000 miniominio miniominio ;

echo Looking for the bucket ${THE_DUDES_BUCKET}

#export RESULT=$(aws --endpoint-url http://minio:9000/ s3api head-bucket --bucket "${THE_DUDES_BUCKET}" 2>&1)
export RESULT=$(mc ls theminio)
echo "Got back the result from aws s3 ls: [ ${RESULT} ]" 
if echo ${RESULT} | grep "${THE_DUDES_BUCKET}"
then
    echo The bucket abides. This is the way.
else
    echo Creating the bucket ${THE_DUDES_BUCKET}
    /usr/local/bin/aws --endpoint-url http://minio:9000/ s3 mb s3://${THE_DUDES_BUCKET}
fi

mc admin service stop theminio

