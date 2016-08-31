{% import_yaml "xbtrepo/aptly-systemd.yml" as tasks %}
{% from 'systemd/macro/tasks.sls' import systemd_tasks %}
{{ systemd_tasks(tasks) }}

aptly-api:
  service:
    - running
    - watch:
      - file: /lib/systemd/system/aptly-api.service
      - file: aptly-binary


aptly-binary:
  file:
    - managed
    - name: /usr/bin/aptly
    - source: https://github.com/maratsh/aptly/releases/download/v0.9.7-path/aptly
    - source_hash: md5=d3068e8804cce8daff21be291b606291
    - mode: 0755
    - show_changes: False
