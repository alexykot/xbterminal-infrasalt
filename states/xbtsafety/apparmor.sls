
apparmor_pkgs:
  pkg:
    - installed
    - refresh: True
    - pkgs:
      - apparmor
      - apparmor-profiles
      - apparmor-utils


apparmor_grub_option:
  file:
    - append
    - name: /etc/default/grub
    - text: 'GRUB_CMDLINE_LINUX="${GRUB_CMDLINE_LINUX}  apparmor=1 security=apparmor"'


apparmor-update-grub:
  cmd:  
   - wait
   - name: update-grub
   - watch:
     - file: apparmor_grub_option
