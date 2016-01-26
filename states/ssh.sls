/etc/ssh/sshd_config:
  file.append:
    - text:
      - 'PasswordAuthentication no'
      - 'PermitRootLogin no'
      - 'PubkeyAuthentication yes'

disable_options:
  file:
    - comment
    - name: /etc/ssh/sshd_config
    - regex: ^.*.PasswordAuthentication.*.$

sshd:
  service:
    - running
    - enable: True
    - reload: True
    - watch:
      - file: /etc/ssh/sshd_config
