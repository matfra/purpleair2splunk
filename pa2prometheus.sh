#!/bin/bash

LISTEN_PORT=8765
LISTEN_IP=0.0.0.0

workdir=$(dirname $(readlink -f "$0"))

sudo docker kill pa2splunk
sudo docker rm pa2splunk
sudo docker run --restart=always \
	-d \
	--name pa2splunk \
	--link splunk \
	-v $workdir/nginx_conf:/etc/nginx/conf.d \
	-p $LISTEN_IP:$LISTEN_PORT:80/tcp \
	openresty/openresty:alpine
