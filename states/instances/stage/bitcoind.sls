{% import_yaml "instances/stage/stage.yml" as cloud %}
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
    - tag: {'Env': 'stage', 'Role': 'bitcoind', 'Name': '{{ bd.name }}-{{ noma }}'}
    - sync_after_install: grains
    - start_action: state.highstate
    - network_interfaces:
      - DeviceIndex: 0
        PrivateIpAddress: {{ bd.Subnet24 }}.1{{ noma }}
        AssociatePublicIpAddress: True
        SubnetId: {{ bd.SubnetId }}
        SecurityGroupId: {{ bd.SecurityGroupId }}

{% endfor %}