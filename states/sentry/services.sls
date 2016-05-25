include:
  - systemd

{% from "sentry/map.jinja" import sentry with context %}

{% for task in sentry.tasks %}
/etc/systemd/system/{{ task.name }}.service:
  file:
    - managed
    - source: salt://sentry/files/task.service
    - mode: 0600
    - user: root
    - group: root
    - template: jinja
    - context:
      task: {{ task }}

systemctl enable {{ task.name }}.service:
  cmd:
    - run
    - watch:
      - file: /etc/systemd/system/*
      - cmd: systemctl daemon-reload

systemctl start {{ task.name }}.service:
  cmd:
    - run
    - watch:
      - file: /etc/systemd/system/*
      - cmd: systemctl daemon-reload
{% endfor %}