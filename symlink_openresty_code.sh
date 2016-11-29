#!/bin/bash
set -ev

pwd=$(pwd)
if [ -f /usr/local/openresty/nginx/conf/nginx.conf ]; then
  cp /usr/local/openresty/nginx/conf/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf`date +%T`
  rm /usr/local/openresty/nginx/conf/nginx.conf
fi

ln -s $pwd/openresty/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
ln -s $pwd/openresty /usr/local/openresty/lualib/google_map_normalised_coord
ln -s $pwd/www /tmp/www
