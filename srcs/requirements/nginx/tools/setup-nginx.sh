#!/bin/bash

openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=learner/CN=changhyl" -keyout /etc/ssl/private/changhyl_p.key -out /etc/ssl/certs/changhyl.crt
chmod 600 /etc/ssl/certs/changhyl.crt /etc/ssl/private/changhyl_p.key
service nginx start

tail -f