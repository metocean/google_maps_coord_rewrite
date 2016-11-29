#!/bin/bash

pwd=$(pwd)

trap kill_nginx INT

kill_nginx()
{
  if [ -f /run/nginx.pid ]; then
    kill $(cat /run/nginx.pid);
  fi

  if [ -f /usr/local/openresty/nginx/logs/nginx.pid ]; then
    kill $(cat /usr/local/openresty/nginx/logs/nginx.pid);
  fi

  if [ ! -z `pidof -s nginx` ]; then
    PID=$(ps -o ppid= `pidof -s nginx`)
    kill $PID
  fi
}

kill_nginx

if [ ! -z `pidof -s nginx` ]; then
  echo 'another nginx is running not using /run/nginx.pid kill this manually and try again'
  exit 1
fi

/usr/local/openresty/nginx/sbin/nginx

while inotifywait --recursive --format %w%f -e modify $pwd/openresty; do
  /usr/local/openresty/nginx/sbin/nginx -s reload
done

