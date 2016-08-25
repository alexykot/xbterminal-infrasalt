{% from "xbtapp/map.jinja" import xbt with context %}
{% from 'systemd/macro/tasks.sls' import systemd_tasks %}
{{ systemd_tasks(xbt.tasks) }}
