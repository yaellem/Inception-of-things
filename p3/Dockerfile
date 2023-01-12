FROM nginx:latest

COPY ./v1 /usr/share/nginx/html
COPY ./confs/nginx.conf /etc/nginx/nginx.conf
COPY ./insecure_cert.crt /etc/nginx/certs/example.crt
COPY ./insecure_key.key /etc/nginx/certs/example.key

