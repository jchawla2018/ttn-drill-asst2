FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /usr/share/nginx/ttn
COPY ttn/  /usr/share/nginx/ttn/
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
