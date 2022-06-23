$ echo "hello world" > index.html
$ docker run -d -p 80:80 \
-v $PWD/index.html:/usr/share/caddy/index.html \
-v caddy_data:/data \
caddy
...
$ curl http://localhost/
hello world

####

docker run -d -p 80:80 \
-v $PWD/Caddyfile:/etc/caddy/Caddyfile \
-v caddy_data:/data \
caddy

####

docker build -t mycaddy -f Dockerfile.1 .

#####

$ docker run -d -p 80:80 -p 443:443 \
    -v /site:/srv \
    -v caddy_data:/data \
    -v caddy_config:/config \
    caddy caddy file-server --domain example.com

####

$ caddy_container_id=$(docker ps | grep caddy | awk '{print $1;}')
$ docker exec -w /etc/caddy $caddy_container_id caddy reload

###

version: "3.7"

services:
caddy:
  image: caddy:<version>
  restart: unless-stopped
  ports:
    - "80:80"
    - "443:443"
  volumes:
    - $PWD/Caddyfile:/etc/caddy/Caddyfile
    - $PWD/site:/srv
    - caddy_data:/data
    - caddy_config:/config

volumes:
caddy_data:
  external: true
caddy_config:


####

https://endjin.com/blog/2022/01/introduction-to-containers-and-docker

https://docs.docker.com/get-started/