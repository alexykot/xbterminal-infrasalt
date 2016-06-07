systemctl daemon-reload:
  cmd:
    - wait
    - name: systemctl daemon-reload
    - watch:
      - file:  /lib/systemd/system/*
