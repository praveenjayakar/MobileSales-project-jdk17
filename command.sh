#!/bin/bash

docker run \
  -e ELASTIC_APM_SERVICE_NAME=MobileSales \
  -e ELASTIC_APM_SERVER_URLS=http://172.232.96.4:32000/ \
  --rm \
  -p 8080:8080 \
  -e ELASTIC_APM_SECRET_TOKEN=supersecret \
  -e ELASTIC_APM_ENVIRONMENT=production \
  -e ELASTIC_APM_APPLICATION_PACKAGES=com.example.mobilesales \
  mobilesales:latest

