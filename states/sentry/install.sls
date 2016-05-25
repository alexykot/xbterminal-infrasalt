{% from "sentry/map.jinja" import sentry with context %}

sentry_required_pkgs:
  pkg.installed:
    - names:
      - python-virtualenv
      - python-dev
      - libpq-dev
      - libxml2-dev
      - libxslt1-dev
      - libffi-dev

sentry_user:
  user.present:
    - name: sentry
    - uid: 1554
    - gid:  1554
    - gid_from_name: True
    - shell: /bin/bash
    - home: /var/lib/sentry

/var/lib/sentry/venv:
  virtualenv.managed:
    - requirements: salt://sentry/files/requirements.txt
    - user: sentry
    - python: /usr/bin/python2
    - require:
      - pkg: sentry_required_pkgs
      - user: sentry_user

sentry_db_upgrade:
   cmd.script:
    - source: salt://sentry/files/sentry_upgrade.sh
    - user: sentry
    - env:
      - SENTRY_CONF: /etc/sentry
    - require:
      - virtualenv: /var/lib/sentry/venv