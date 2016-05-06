{% from "xbtapp/map.jinja" import app with context %}

/var/www/xbterminal.com/xbterminal/xbterminal/local_settings.py:
  file:
    - managed
    - source: salt://xbtapp/files/local_settings.py.template
    - template: jinja
    - user: root
    - group: xbt-app
    - mode: 0640
    - context:
      config: {{ app.config }}

/etc/nginx/conf.d/xbterminal.conf:
  file:
    - managed
    - source: salt://xbtapp/files/nginx.conf
    - mode: 0600
    - user: root
    - group: root


/etc/systemd/system/xbterminal-uwsgi.service:
  file:
    - managed
    - source: salt://xbtapp/files/xbterminal-uwsgi.service
    - mode: 0600
    - user: root
    - group: root

/etc/xbterminal/uwsgi-xbterminal.ini:
  file:
    - managed
    - source: salt://xbtapp/files/uwsgi-xbterminal.ini
    - makedirs: True
    - mode: 0600
    - user: root
    - group: root

/var/www/xbterminal.com/logs/:
  file:
    - directory
    - mode: 0700
    - user: xbt-app
    - group: xbt-app
