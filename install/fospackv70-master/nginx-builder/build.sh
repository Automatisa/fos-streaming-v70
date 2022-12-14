#!/bin/bash
cd $PWD/nginx-1.19.1
./configure \
--user=fosstreaming \
--group=fosstreaming \
--prefix=/home/fos-streaming/fos/nginx \
--sbin-path=/home/fos-streaming/fos/nginx/sbin/nginx            \
--conf-path=/home/fos-streaming/fos/nginx/conf/nginx.conf       \
--pid-path=/home/fos-streaming/fos/nginx/pid/nginx.pid         \
--lock-path=/var/lock/nginx.lock \
--error-log-path=/home/fos-streaming/fos/logs/error.log \
--error-log-path=/home/fos-streaming/fos/logs/error.log \
--http-log-path=/home/fos-streaming/fos/logs/access.log \
--http-client-body-temp-path=/home/fos-streaming/fos/nginx/client_body_temp \
--http-fastcgi-temp-path=/home/fos-streaming/fos/nginx/fastcgi_temp \
--http-proxy-temp-path=/home/fos-streaming/fos/nginx/proxy_temp \
--http-scgi-temp-path=/home/fos-streaming/fos/nginx/uwsgi_temp \
--http-uwsgi-temp-path=/home/fos-streaming/fos/nginx/scgi_temp \
--with-pcre                   \
--with-file-aio \
--with-http_v2_module \
--with-http_secure_link_module \
--with-http_geoip_module \
--with-http_gunzip_module \
--with-http_flv_module  \
--with-http_mp4_module \
--with-http_gzip_static_module \
--with-http_image_filter_module \
--with-http_addition_module \
--with-http_sub_module \
--with-http_xslt_module \
--with-http_ssl_module \
--with-http_stub_status_module \
--with-http_realip_module \
--with-cc-opt=-Wno-error \
--with-stream \
--with-debug \
--with-stream_ssl_module \
--with-threads \
--add-module=../mods/ngx_devel_kit \
--add-module=../mods/nginx-rtmp-module
make -j`nproc`
make install
make clean
rm -Rf /home/fos-streaming/fos/nginx/sbin/nginx_fos; ln -sf /home/fos-streaming/fos/nginx/sbin/nginx /home/fos-streaming/fos/nginx/sbin/nginx_fos
