bitcoind_abc:
  version: 0.15.0
  hash: md5=df29252ab306618bf06aa7c0b0f0c188
  datadisk:
    blockdevice: False
    dev: /dev/xvdb
    dir: /var/bitcoind/

  config:
    testnet: 1
    daemon: 0
    dbcache: 50
    maxconnection: 10
    timeout: 15000
    datadir: /var/bitcoind/
    rpcuser: test
    rpcpassword: 123
    rpcallowip: 0.0.0.0
    rpcthreads: 10
    txindex: 1
    logips: 1
    printtoconsole: 1
    maxtxfee: 0.2

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
