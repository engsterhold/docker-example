# note: never use the :latest tag in a production site
FROM caddy:latest

COPY Caddyfile /etc/caddy/Caddyfile
COPY site /srv
RUN echo "Hallo"