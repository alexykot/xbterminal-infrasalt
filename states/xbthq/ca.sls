/usr/local/share/ca-certificates/xbthq.crt:
  file:
    - managed
    - source: salt://xbthq/files/xbthq.root.crt


update-ca-certificates:
  cmd:
    - wait
    - watch:
      - file: /usr/local/share/ca-certificates/xbthq.crt
