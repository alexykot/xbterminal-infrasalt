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
{% if 'xbt-migrator' in grains['roles'] and salt['pillar.get']('xbt_migrate', False) %}
  - xbtapp.migrate
{% endif %}

extend:
  /var/www/xbterminal.com/xbterminal/xbterminal/local_settings.py:
    file:
      - require_in:
        - cmd: /var/www/xbterminal.com/venv/bin/python*

xbterminal-website:
  pkg:
    {% if salt['pillar.get']('version') %}
    - installed
    - version: '{{ salt['pillar.get']('version') }}'
    {% else %}
    - latest
    {% endif %}
    - refresh: True
    - require_in:
      - file: /var/www/xbterminal.com/xbterminal/xbterminal/local_settings.py
      - file: /var/www/xbterminal.com/logs/
      - cmd: /var/www/xbterminal.com/venv/bin/python*


xbterminal-website-translations:
   cmd.run:
    - name: /var/www/xbterminal.com/venv/bin/python /var/www/xbterminal.com/xbterminal/manage.py compilemessages
    - require:
      - pkg: xbterminal-website
      - file: /var/www/xbterminal.com/xbterminal/xbterminal/local_settings.py


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
