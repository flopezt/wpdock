FROM    ubuntu:latest

RUN     apt update && \
        apt install -y apache2 php php-mysql libapache2-mod-php wget && \
        rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN     wget https://es.wordpress.org/latest-es_ES.tar.gz -P /tmp && \
        tar zxfv /tmp/latest-es_ES.tar.gz -C /tmp && \
        mv /tmp/wordpress/* /var/www/html/ && \
        rm -fR /tmp/* /var/www/html/index.html && \
	chown -R www-data:www-data /var/www/html/ && \ 
	chmod -R 755 /var/www/html/ && \
	ln -sf /dev/stdout /var/log/apache2/access.log && \     
	ln -sf /dev/sterr /var/log/apache2/error.log 

EXPOSE  80

ENTRYPOINT ["/usr/sbin/apache2ctl"]

CMD ["-D", "FOREGROUND"]
