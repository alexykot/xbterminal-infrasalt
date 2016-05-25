{% from "sentry/map.jinja" import sentry with context %}

/etc/sentry/sentry.conf.py:
  file.managed:
    - source: salt://sentry/files/sentry.conf.py
    - user: sentry
    - group: sentry
    - template: jinja
    - makedirs: True
    - context:
      config: {{ sentry.config }}


/etc/sentry/config.yml:
  file.managed:
    - source: salt://sentry/files/config.yml
    - user: sentry
    - group: sentry
    - template: jinja
    - makedirs: True
    - context:
      config: {{ sentry.config }}