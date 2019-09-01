FROM nginx:1.13.0-alpine

WORKDIR /app
ENV DOLLAR="$"
COPY ./dist ./dist
COPY ./docker ./docker

RUN ["chmod", "+x", "docker/fix-permissions.sh"]
RUN ["chmod", "+x", "docker/env-entrypoint.sh"]

RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./dist /usr/share/nginx/html

RUN ./docker/fix-permissions.sh ./

RUN chmod -R 777 /var/cache/nginx /var/run /var/log/nginx

EXPOSE 3010
RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf
ENTRYPOINT docker/env-entrypoint.sh && nginx -g 'daemon off;'