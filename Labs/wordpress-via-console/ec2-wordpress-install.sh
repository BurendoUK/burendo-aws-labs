#! /bin/bash

echo "----------- Starting WordPress install    -----------"
set +v

# Install services
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum update -y
sudo yum -y install yum-utils

sudo yum-config-manager --disable 'remi-php*'
sudo yum-config-manager --enable remi-php81

sudo yum install mysql -y
sudo yum install php81 php81-php-fpm php81-php-mysqlnd -y
sudo amazon-linux-extras install nginx1 -y

# Configure NGINX
touch /etc/nginx/conf.d/wordpress.conf

sudo cat <<EOF | sudo tee /etc/nginx/nginx.conf
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                      '\$status \$body_bytes_sent "\$http_referer" '
                      '"\$http_user_agent" "\$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 4096;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;

    server {
        listen       80;
        server_name  _;
        root         /usr/share/nginx/html;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        error_page 404 /404.html;
        location = /404.html {
        }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
        }
    }
}
EOF

sudo cat <<EOF | sudo tee /etc/nginx/conf.d/wordpress.conf
server {
    listen 80 default_server;
    root /var/www/html;

    index index.php index.html index.htm;

    location / {
        try_files \$uri \$uri/ /index.php?q=\$uri&\$args;
    }

    location ~* /(?:uploads|files)/.*\.php$ {
        deny all;
    }
    # REQUIREMENTS : Enable PHP Support
    location ~ \.php$ {
        try_files \$uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
    }
}
EOF

# Configure PHP-FPM
# /etc/opt/remi/php81/php-fpm.d/www.conf

sudo sed -i 's/user = apache/user = nginx/g' /etc/opt/remi/php81/php-fpm.d/www.conf
sudo sed -i 's/group = apache/group = nginx/g' /etc/opt/remi/php81/php-fpm.d/www.conf
sudo sed -i 's/;listen.owner = apache/listen.owner = nginx/g' /etc/opt/remi/php81/php-fpm.d/www.conf
sudo sed -i 's/;listen.group = apache/listen.group = nginx/g' /etc/opt/remi/php81/php-fpm.d/www.conf
sudo sed -i 's/;listen.mode = 0660/listen.mode = 0660/g' /etc/opt/remi/php81/php-fpm.d/www.conf

sudo sed -i 's/listen = 127.0.0.1:9000/listen = \/var\/run\/php-fpm.sock/g' /etc/opt/remi/php81/php-fpm.d/www.conf

sudo chgrp www /var/run/php-fpm.sock

# Create WWW group
sudo groupadd www
sudo usermod -aG www ec2-user
sudo usermod -aG www nginx

# Download and position WordPress
sudo mkdir -p /var/www/html
sudo chgrp www -R /var/www
sudo wget https://wordpress.org/latest.tar.gz -P /var/www
cd /var/www
sudo tar -xvzf latest.tar.gz
sudo mv /var/www/wordpress/* /var/www/html

# Set permissions for WordPress
sudo chgrp www -R /var/www/html
sudo chown nginx -R /var/www/html
sudo find . -type d -exec chmod 755 {} \;
sudo find . -type f -exec chmod 644 {} \;

echo "----------- Starting web services         -----------"

# Start services
sudo service php81-php-fpm start
sudo service nginx start

echo "----------- Finished WordPress install    -----------"
trap echo "----------- ERROR WordPress install    -----------" EXIT
