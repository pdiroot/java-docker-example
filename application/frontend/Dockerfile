FROM nginx:1.17.8-alpine

RUN apk add --no-cache --virtual .healthcheck curl

COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY web /var/www

HEALTHCHECK --interval=5s --timeout=2s --retries=6 \
  CMD curl -sf http://localhost/health || exit 1
