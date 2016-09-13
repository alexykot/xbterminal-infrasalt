{% from "sentry/map.jinja" import sentry with context %}

include:
  - nginx

/etc/nginx/conf.d/sentry.xbthq.co.uk.conf:
  file:
    - managed
    - source: salt://sentry/files/nginx.conf
    - mode: 0600

/etc/nginx/sentry.xbthq.co.uk.client.conf:
  file:
    - managed
    - source: salt://sentry/files/nginx.client.conf
    - mode: 0600


/etc/nginx/sentry.xbthq.co.uk.ssl.conf:
  file:
    - managed
    - source: salt://sentry/files/nginx.ssl.conf
    - mode: 0600

/etc/nginx/ssl/ca.crt:
  file:
    - managed
    - source: salt://xbthq/files/xbthq.root.crt
    - makedirs: True
    - mode: 0600


/etc/nginx/ssl/sentry.xbthq.co.uk/sentry.xbthq.co.uk.key:
  file:
    - managed
    - makedirs: true
    - mode: 0600
    - show_changes: False
    - contents_pillar: sentry:key

/etc/nginx/ssl/sentry.xbthq.co.uk/sentry.xbthq.co.uk.crt:
  file:
    - managed
    - mode: 0600
    - template: jinja
    - makedirs: true
    - show_changes: False
    - contents_pillar: sentry:crt
