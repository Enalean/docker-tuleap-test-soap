FROM centos:6

COPY RPM-GPG-KEY-remi /etc/pki/rpm-gpg/
COPY *.repo /etc/yum.repos.d/

RUN yum -y install epel-release centos-release-scl && \
    yum -y install \
        tuleap \
        httpd24-httpd \
        mysql-server \
        php56-php-mysqlnd \
        php56-php-pdo \
        php56-php-xml \
        php56-php-mbstring \
        php56-php-gd \
        php56-php-soap \
        php56-php-pear \
        php56-php-intl \
        php56-php-process \
        php56-php-cli \
        php56-php-bcmath \
        php56-php-fpm \
        php56-php-opcache \
        php56-php-pecl-jsonc \
    && \
    yum remove -y tuleap \
        tuleap-core-subversion \
        tuleap-core-subversion-modperl \
        tuleap-documentation && \
    yum clean all && \
    curl -k -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin

CMD /usr/share/tuleap/tests/soap/bin/run.sh
