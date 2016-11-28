{% import_yaml "instances/stage/cloud.yml" as cloud %}
{% set sam = cloud.aws.roles.sam %}

{% for noma in range(1, sam.count +1 ) %}

{{ sam.name }}-0{{ noma }}:
  cloud.present:
    - cloud_provider: aws
    - size: {{ sam.size }}
    - ssh_username: {{ cloud.aws.ssh_username }}
    - image: {{ cloud.aws.ami }}
    - del_all_vols_on_destroy:  {{ cloud.aws.del_all_vols_on_destroy }}
    - volumes: {{ sam.volumes }}
    - tag: {'Env': {{ cloud.env }}, 'Roles': 'xbtsam', 'Name': '{{ sam.name }}-0{{ noma }}'}
    - sync_after_install: grains
    - network_interfaces:
      - DeviceIndex: 0
        PrivateIpAddress: {{ sam.Subnet24 }}.3{{ noma }}
        AssociatePublicIpAddress: True
        SubnetId: {{ sam.SubnetId }}
        SecurityGroupId: {{ sam.SecurityGroupId }}
    - minion: { 'grains': { 'roles': [ 'xbtsam' ] } }


{{ sam.name }}-0{{ noma }} - highstate:
  salt.state:
    - tgt: {{ sam.name }}-0{{ noma }}
    - highstate: True
    - require:
      - cloud: {{ sam.name }}-0{{ noma }}
      
{{ sam.name }}-0{{ noma }}.xbthq.int:
  boto_route53.present:
    - value: {{ sam.Subnet24 }}.3{{ noma }}
    - zone: xbthq.int
    - ttl: 60
    - record_type: A
    - region: eu-west-1

{% endfor %}
