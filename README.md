rep2 Dockerfile.
================
This is Dockerfile to serve rep2(http://akid.s17.xrea.com/).
Writing functions have not tested.

How to use
----------

    docker.io build --rm -t rep2 .
    docker.io run -p 8080:80 -v /path/to/rep2-data:/srv/rep2-data --name REP2 -d rep2

To access with reverse proxy, set HTTP-X-SCRIPTNAME to pass real request uri.

    upstream rep2 {
        server 127.0.0.1:8080;
    }

    location /rep2/ {
        proxy_pass http://rep2/;
        proxy_set_header X-Script-Name /rep2;
    }


