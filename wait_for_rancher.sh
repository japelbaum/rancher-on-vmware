#!/bin/bash
url="https://$1/ping"
while [ "$resp" != "pong" ]; do
    resp=$(curl -k -s $url)
    echo "Waiting for $url - $resp"
    if [ "$resp" != "pong" ]; then
      sleep 10
    fi
done