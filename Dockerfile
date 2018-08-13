FROM centos:6

COPY RPM-GPG-KEY-remi /etc/pki/rpm-gpg/
COPY *.repo /etc/yum.repos.d/

RUN yum -y install epel-release centos-release-scl && \
    yum -y install \
        tuleap \
        httpd24-httpd \
        mysql-server \
        php72-php-mysqlnd \
        php72-php-pdo \
        php72-php-xml \
        php72-php-mbstring \
        php72-php-gd \
        php72-php-soap \
        php72-php-pear \
        php72-php-intl \
        php72-php-process \
        php72-php-cli \
        php72-php-bcmath \
        php72-php-fpm \
        php72-php-opcache \
        php72-php-pecl-jsonc \
    && \
    yum remove -y tuleap \
        tuleap-core-subversion \
        tuleap-core-subversion-modperl \
        tuleap-documentation && \
    yum clean all && \
    curl -k -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin

ENV PHP_VERSION 72

CMD /usr/share/tuleap/tests/soap/bin/run.sh
