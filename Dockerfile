FROM ubuntu:trusty
MAINTAINER Takashi Harada <aruhanbura@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://jp.archive.ubuntu.com/ubuntu/ trusty universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y curl unzip nginx php5-fpm
RUN apt-get upgrade -y && apt-get -y autoremove && apt-get -y clean

RUN curl -L -o /tmp/rep2.zip http://akid.s17.xrea.com/cgi/dl/dl.php?dl=p2
RUN unzip -x /tmp/rep2.zip -d /srv/
RUN ln -s /srv/rep2-data /srv/rep2/data

RUN echo "cgi.fix_pathinfo = 0;" >> /etc/php5/fpm/php.ini
ADD nginx.conf /etc/nginx/nginx.conf
ADD nginx-rep2.conf /etc/nginx/sites-available/default

ADD start.sh /start.sh
RUN chmod +x /start.sh

VOLUME ["/srv/rep2-data"]
EXPOSE 80/tcp
ENTRYPOINT ["sh" "/start.sh"]

