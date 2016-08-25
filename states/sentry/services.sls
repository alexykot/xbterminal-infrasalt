{% from "sentry/map.jinja" import sentry with context %}
{% from 'systemd/macro/tasks.sls' import systemd_tasks %}
{{ systemd_tasks(sentry.tasks) }}
