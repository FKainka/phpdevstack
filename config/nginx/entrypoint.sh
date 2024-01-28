#!/bin/bash

# Ersetzen Sie die Werte in den Template-Dateien
envsubst < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/nginx.conf

# Starten Sie Nginx
exec nginx -g "daemon off;"
