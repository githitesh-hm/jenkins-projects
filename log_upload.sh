#!/bin/bash

# Variables
LOG_DIR="/var/log/apache2"
S3_BUCKET="hiteshbucket0607"
TIMESTAMP=$(date +%Y%m%d%H%M%S)

# Compress logs
tar -czf /tmp/apache-logs-$TIMESTAMP.tar.gz -C $LOG_DIR access.log error.log

# Upload logs to S3
aws s3 cp /tmp/apache-logs-$TIMESTAMP.tar.gz s3://$S3_BUCKET/

# Cleanup local compressed file
rm -f /tmp/apache-logs-$TIMESTAMP.tar.gz
