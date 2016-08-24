{% from "xbtapp/map.jinja" import app with context %}


{% for cert in  [ 'COMODORSADomainValidationSecureServerCA.pem', 'COMODORSAAddTrustCA.pem', 'AddTrustExternalCARoot.pem' ] %}
/var/www/xbterminal.com/certs/bip70/{{ cert }}:
  file:
    - managed
    - makedirs: True
    - mode: 0600
    - user: xbt-app
    - group: xbt-app
    - source: salt://xbtapp/files/certs/{{ cert }}

{% endfor %}

/var/www/xbterminal.com/certs/client/server.crt:
  file:
    - managed
    - makedirs: True
    - mode: 0600
    - user: xbt-app
    - group: xbt-app
    - show_changes: False
    - contents_pillar: xbt:app:infrastructure-certs:crt

/var/www/xbterminal.com/certs/client/server.key:
  file:
    - managed
    - makedirs: True
    - mode: 0600
    - user: xbt-app
    - group: xbt-app
    - show_changes: False
    - contents_pillar: xbt:app:infrastructure-certs:key


/var/www/xbterminal.com/certs/xbthq.crt:
  file:
    - managed
    - makedirs: True
    - mode: 0600
    - user: xbt-app
    - group: xbt-app
    - show_changes: False
    - contents_pillar: xbt:app:infrastructure-certs:ca

/var/www/xbterminal.com/certs/bip70/xbterminal_io.pem:
  file:
    - managed
    - makedirs: True
    - mode: 0600
    - user: xbt-app
    - group: xbt-app
    - show_changes: False
    - contents_pillar: xbt:app:infrastructure-certs:xbt_payment_protocol_crt

/var/www/xbterminal.com/certs/bip70/xbterminal_io.key:
  file:
    - managed
    - makedirs: True
    - mode: 0600
    - user: xbt-app
    - group: xbt-app
    - show_changes: False
    - contents_pillar: xbt:app:infrastructure-certs:xbt_payment_protocol_key
