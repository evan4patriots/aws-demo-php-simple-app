FROM centos:7

MAINTAINER "evan.brown" <evan.brown@4patriots.com>

RUN yum -y install httpd php php-cli mod_security jq
RUN /sbin/chkconfig httpd on

#ADD index.php /var/www/html/index.php
#ADD test.php /var/www/html/test.php
ADD environment /var/www/.env
ADD vendor /var/www/vendor
ADD www /var/www/html

EXPOSE 80

ADD infrastructure/run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]