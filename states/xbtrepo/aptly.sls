{% import_yaml "xbtrepo/aptly-systemd.yml" as tasks %}
{% from 'systemd/macro/tasks.sls' import systemd_tasks %}
{{ systemd_tasks(tasks) }}

aptly-api:
  service:
    - running
    - watch:
      - file: /lib/systemd/system/aptly-api.service


aptly:
  pkg:
    - installed
    - version: 0.9.5
    - require_in:
      - service: aptly-api
