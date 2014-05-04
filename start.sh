#!/bin/bash
# Starts up Nginx and PHP within the container.

DATADIR="/srv/rep2-data"

# Don't continue if we catch an error.
set -e

# Ensure mysql owns the DATADIR
chown -R www-data $DATADIR

service php5-fpm start
/usr/sbin/nginx
