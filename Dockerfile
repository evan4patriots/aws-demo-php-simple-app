FROM centos:7

MAINTAINER "evan.brown" <evan.brown@4patriots.com>

RUN yum -y install httpd php php-cli mod_security jq

RUN ln -sf /proc/self/fd/1 /var/log/httpd/access.log && \
    ln -sf /proc/self/fd/1 /var/log/httpd/error.log

RUN /sbin/chkconfig httpd on

ADD environment /var/www/.env
ADD vendor /var/www/vendor
ADD www /var/www/html

EXPOSE 80

ADD infrastructure/run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]