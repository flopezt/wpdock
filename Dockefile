FROM debian:9

RUN	apt-get update && apt install -y apache2 curl php php-mysql && \
	cd /var/www/ && \
	curl https://wordpress.org/latest.tar.gz | tar -xz && \
	rm -rf html/ && \
	mv wordpress/ html/ && chown -R root:root html/ && \
	echo "ServerName Wordpress01" > /etc/apache2/conf-enabled/serverName.conf && \
	ln -sf /dev/stdout /var/log/apache2/access.log && \
	ln -sf /dev/sterr /var/log/apache2/error.log && \
	rm -rf /var/lib/apt /var/lib/dpkg /var/cache/apt /usr/share/doc /usr/share/man /usr/share/info

EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
