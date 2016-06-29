{% from "xbtapp/map.jinja" import app with context %}


include:
  - redis
  - nginx
  - xbthq.repo
  - systemd.reload
  - xbtapp.config
  - xbtapp.certs
{% if 'xbt-tasks' in grains['roles'] %}
  - xbtapp.tasks
{% endif %}

xbterminal-website:
  pkg:
    - installed
    - version: '{{ salt['pillar.get']('version', app.version )|default('>1') }}'
    - refresh: True
    - require_in:
      - file: /var/www/xbterminal.com/xbterminal/xbterminal/local_settings.py
      - file: /var/www/xbterminal.com/logs/


uwsgi-pkg:
  pkg:
    - installed
    - pkgs:
      - uwsgi-plugin-python
      - uwsgi

xbterminal-uwsgi:
  service:
    - running
    - enable: True
    - watch:
      - pkg: uwsgi-pkg
      - file: /etc/xbterminal/uwsgi-xbterminal.ini
      - pkg: xbterminal-website
      - file: /var/www/xbterminal.com/xbterminal/xbterminal/local_settings.py
      - file: /etc/nginx/conf.d/xbterminal.conf
      - cmd: systemctl daemon-reload
