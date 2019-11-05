FROM php:7.2-fpm-alpine
LABEL maintainer="tanzhilian@sina.cn"
RUN apk add --no-cache supervisor bash perl nginx tzdata \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/pear \
    && mkdir /var/lib/awstats \
    && mkdir /var/log/awstats \
    && mkdir /usr/local/awstats \
    && mkdir /etc/awstats \
    && mkdir /var/log/supervisor

WORKDIR /app

ENV TZ=Asia/Shanghai

COPY . .
COPY ./docker-entrypoint.sh /usr/local/bin/
COPY ./awstats  /usr/local/awstats
COPY ./awstats.localhost.conf /etc/awstats
COPY ./nginx-conf/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx-conf/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./supervisor/supervisor.d /etc/supervisor.d

ENTRYPOINT [ "docker-entrypoint.sh" ]