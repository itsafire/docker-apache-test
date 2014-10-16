FROM nawork/baseimage

RUN apt-get -y update && apt-get -y --no-install-recommends upgrade
RUN apt-get install -y --no-install-recommends apache2 php5-fpm

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# apache startup script
ADD service-apache.sh /etc/service/apache/run
ADD service-fpm.sh /etc/service/fpm/run

# PHP demo files
ADD index.php /var/www/html/
RUN rm /var/www/html/index.html
# apache config
ADD 000-default.conf /etc/apache2/sites-available/
ADD apache2.conf /etc/apache2/
ADD default-ssl.conf /etc/apache2/sites-available/
ADD php-fpm.conf /etc/php5/fpm/
ADD www.conf /etc/php5/fpm/pool.d/
RUN /usr/sbin/a2enmod proxy_fcgi

EXPOSE 80
VOLUME /var/www
VOLUME /etc/php5
VOLUME /etc/apache2

CMD ["/sbin/my_init"]
