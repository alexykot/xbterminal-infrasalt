bitcoind:
  net: testnet
  datadisk:
    dir: /var/bitcoind/
    dev: /dev/xvdh
  datadir: /var/bitcoind/testnet
  rpcuser: testnet
  rpcpassword: '123123'
  rpcallowip: [ 172.90.0.0/16, 188.226.182.85/32 ]
  rpcthreads: 10
  txindex: 1
  logips: 1
