FROM centos:6

MAINTAINER "fontesj" <fontesj@amazon.com>

RUN yum -y install httpd php php-cli mod_security jq
RUN /sbin/chkconfig httpd on

ADD index.php /var/www/html/index.php
ADD test.php /var/www/html/test.php
ADD www /var/www/html/www

EXPOSE 80

ADD infrastructure/run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
