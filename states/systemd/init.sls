systemctl daemon-reload:
  cmd:
    - wait
    - name: systemctl daemon-reload
    - watch:
      - file:  /etc/systemd/system/*