FROM debian

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y apache2 \
 && apt-get install -y php \
 && apt-get install -y libapache2-mod-php  \
 && apt-get install -y php-mysql \
 && rm -rf /var/lib/apt/lists/*

COPY /src/ /var/www/html/
COPY /conf/ /etc/apache2/sites-available/
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
