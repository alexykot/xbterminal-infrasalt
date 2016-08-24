{% from "xbtapp/map.jinja" import xbt with context %}
{% from 'systemd/tasks.sls' import systemd_tasks %}
{{ systemd_tasks(xbt.tasks) }}
