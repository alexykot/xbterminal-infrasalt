{% import_yaml "instances/prod/cloud.yml" as cloud %}
{% set bd = cloud.aws.roles.bitcoind %}

{% for noma in range(1, bd.count +1 ) %}

{{ bd.name }}-0{{ noma }}:
  cloud.present:
    - cloud_provider: aws
    - size: {{ bd.size }}
    - ssh_username: {{ cloud.aws.ssh_username }}
    - image: {{ cloud.aws.ami }}
    - del_all_vols_on_destroy:  {{ cloud.aws.del_all_vols_on_destroy }}
    - volumes: {{ bd.volumes }}
    - tag: {'Env': 'prod', 'Role': 'xbt-bitcoind', 'Name': '{{ bd.name }}-0{{ noma }}'}
    - sync_after_install: grains
    - network_interfaces:
      - DeviceIndex: 0
        PrivateIpAddress: {{ bd.Subnet24 }}.2{{ noma }}
        AssociatePublicIpAddress: True
        SubnetId: {{ bd.SubnetId }}
        SecurityGroupId: {{ bd.SecurityGroupId }}
    - minion: { 'grains': { 'roles': [ 'xbt-bitcoin' ] } }


{{ i.name }}-0{{ noma }} - highstate:
  salt.state:
    - tgt: {{ i.name }}-0{{ noma }}
    - highstate: True
    - require:
      - cloud: {{ i.name }}-0{{ noma }}
      - salt: {{ i.name }}-0{{ noma }} set grains
{% endfor %}