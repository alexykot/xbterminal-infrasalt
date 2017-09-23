bitcoind-user:
  user:
    - present
    - name: bitcoind
    - uid: 61001
    - gid: 61001
    - home: /var/bitcoind
    - gid_from_name: True
