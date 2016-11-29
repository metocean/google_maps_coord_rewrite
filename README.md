# google_maps_coord_rewrite
fixes negative X coord nums "/2/-1/3.png" from google maps via nginx and openresty.

# usage
openning the follow two links an both should return the same tile.  
http://127.0.0.1/tiletest/2/-1/1.png  
http://127.0.0.1/tiletest/2/3/1.png  

# install
first you must have openresty installed http://openresty.org/en/
 
* run: ```sudo bash symlink_openresty_code.sh``` this symlinks this exmample project to openresty.
* start openresty via ```sudo bash openresty_autoreload.sh``` note: this requires inotifywait app
* or start openresty directy ```/usr/local/openresty/nginx/sbin/nginx -s reload```

