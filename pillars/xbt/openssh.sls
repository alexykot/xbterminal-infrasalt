sshd_config:
  Port: 932
  Protocol: 2
  HostKey:
    - /etc/ssh/ssh_host_rsa_key
    - /etc/ssh/ssh_host_dsa_key
    - /etc/ssh/ssh_host_ecdsa_key
    - /etc/ssh/ssh_host_ed25519_key
  UsePrivilegeSeparation: 'yes'
  KeyRegenerationInterval: 3600
  ServerKeyBits: 1024
  SyslogFacility: AUTH
  LogLevel: INFO
  LoginGraceTime: 120
  PermitRootLogin: 'no'
  PasswordAuthentication: 'no'
  StrictModes: 'yes'
  RSAAuthentication: 'yes'
  PubkeyAuthentication: 'yes'
  IgnoreRhosts: 'yes'
  RhostsRSAAuthentication: 'no'
  HostbasedAuthentication: 'no'
  PermitEmptyPasswords: 'no'
  ChallengeResponseAuthentication: 'no'
  X11Forwarding: 'no'
  X11DisplayOffset: 10
  PrintMotd: 'no'
  PrintLastLog: 'yes'
  TCPKeepAlive: 'yes'
  AcceptEnv: "LANG LC_*"
  Subsystem: "sftp /usr/lib/openssh/sftp-server"
  UsePAM: 'yes'
  UseDNS: 'yes'
  AllowUsers: 'maratsh alexykot alexy kirill'
  # Check `man sshd_config` for supported KexAlgorithms, Ciphers and MACs first.
  KexAlgorithms: 'diffie-hellman-group14-sha1,diffie-hellman-group1-sha1'
  Ciphers: 'aes128-ctr,aes256-ctr'
  MACs: 'hmac-sha1'
  ClientAliveInterval: 300
  PermitUserEnvironment: 'no'
openssh:
  generate_ed25519_keys: True
  generate_rsa_keys: True
  generate_ecdsa: True
  generate_dsa: True
