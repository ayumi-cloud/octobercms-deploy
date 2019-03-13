#!/bin/bash

apt update

# Install dependencies
apt install -y php7.3 php7.3-fml
apt install -y php7.3-mbstring php7.3-xml php7.3-zip
apt install -y nginx software-properties-common python-software-properties python-pip

# Get basic details of the running instance
EC2_INSTANCE_ID="`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id`"
EC2_ZONE="`wget -q -O - http://169.254.169.254/latest/meta-data/placement/availability-zone`"
EC2_REGION="`echo $EC2_ZONE | sed -e 's:\([0-9][0-9]*\)[a-z]*\$:\\1:'`"

# Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php -- --install-dir=/usr/bin --filename=composer
rm composer-setup.php

# Ruby for codedeploy agent
apt install ruby -y
apt install wget

# Install AWS codedeploy agent
wget https://aws-codedeploy-${EC2_REGION}.s3.amazonaws.com/latest/install
chmod +x ./install
./install auto
service codedeploy-agent start
rm -rf install

# Restart php and nginx
service php7.3-fpm reload
service nginx reload
