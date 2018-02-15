#!/bin/sh

curl -Lv http://admin:admin@localhost:8080/login 2>&1 | grep 'X-SSH-Endpoint'
