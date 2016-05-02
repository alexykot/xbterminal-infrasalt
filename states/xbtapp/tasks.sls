{% set app = pillar['xbt']['app'] %}

#write config
{% for task in app.tasks %}
/etc/systemd/system/xbterminal-{{ task.name }}.service:
  file:
    - managed
    - source: salt://xbtapp/files/task.service
    - mode: 0600
    - user: root
    - group: root
    - template: jinja
    - context:
      task: {{ task }}

/etc/systemd/system/xbterminal-{{ task.name }}.timer:
  file:
    - managed
    - source: salt://xbtapp/files/task.timer
    - mode: 0600
    - user: root
    - group: root
    - template: jinja
    - context:
      task: {{ task }}



systemctl enable xbterminal-{{ task.name }}.timer:
  cmd:
    - wait
    - watch:
      - file: /etc/systemd/system/xbterminal*
      - cmd: systemctl daemon-reload

systemctl start xbterminal-{{ task.name }}.timer:
  cmd:
    - wait
    - watch:
      - file: /etc/systemd/system/xbterminal*
      - cmd: systemctl daemon-reload
      - pkg: xbterminal-website
{% endfor %}