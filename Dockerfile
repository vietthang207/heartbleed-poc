FROM ubuntu:16.04

RUN apt-get update && apt-get install -y gcc make

COPY nginx-1.6.0 nginx-1.6.0
COPY openssl-1.0.1f openssl-1.0.1f
COPY pcre-4.4 pcre-4.4
COPY zlib-1.2.8 zlib-1.2.8

WORKDIR nginx-1.6.0
RUN ./configure --sbin-path=/usr/local/nginx/nginx --conf-path=/usr/local/nginx/nginx.conf --pid-path=/usr/local/nginx/nginx.pid --with-http_ssl_module --with-openssl=../openssl-1.0.1f --with-pcre=../pcre-4.4 --with-zlib=../zlib-1.2.8
RUN make && make install && make clean 

COPY ssl /etc/nginx/ssl
COPY nginx.conf /usr/local/nginx/
COPY index.html /usr/share/nginx/www/

CMD ["/usr/local/nginx/nginx", "-g", "daemon off;"]