{% from "sentry/map.jinja" import sentry with context %}

include:
  - sentry.config
  - sentry.install
  - sentry.services
  - sentry.nginx

extend:
  sentry_db_upgrade:
    cmd:
      - require:
        - file: /etc/sentry/*
