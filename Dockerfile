FROM phusion/baseimage:0.9.13

RUN apt-get update
RUN apt-get install -y apache2 libapache2-mod-php5 collectd

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# apache startup script
ADD apache.sh /etc/service/apache/run
# PHP demo files
ADD index.php /var/www/html/
RUN rm /var/www/html/index.html
# apache config
ADD 000-default.conf /etc/apache2/sites-available/
ADD default-ssl.conf /etc/apache2/sites-available/

# collectd config
ADD collectd.conf /etc/collectd/

EXPOSE 80

CMD ["/sbin/my_init"]
