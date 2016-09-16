{% from "xbtapp/map.jinja" import app with context %}

xbterminal-website-db-migrations:
   cmd.run:
    - name: /var/www/xbterminal.com/venv/bin/python /var/www/xbterminal.com/xbterminal/manage.py migrate --noinput
