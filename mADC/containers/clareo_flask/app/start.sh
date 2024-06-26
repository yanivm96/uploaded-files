#!/bin/sh

#while true; do sleep 60; done

# Allow other containers to stabilise
sleep 5

cd /app


echo "starting cron"
service cron start
echo "starting gunicorn"
export PYTHONUNBUFFERED=1
exec gunicorn -b :5000 --timeout 300 --limit-request-line 0 --worker-class gthread --keep-alive 5 --workers=$GUNICORN_WORKERS --graceful-timeout 900 --access-logfile /config/log/access.log --error-logfile /config/log/error.log --capture-output --log-level debug app:app 

while true; do sleep 60; done