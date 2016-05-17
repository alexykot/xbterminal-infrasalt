apilb:
  boto_elb.present:
    - name: api.xbt.elb
#    - profile: {{ pillar['apielb'] }}
    - availability_zones:
      - eu-west-1a
      - eu-west-1c
      - eu-west-1d
    - listeners:
      - elb_port: 443
        instance_port: 8443
        elb_protocol: HTTPS
        instance_protocol: HTTP
        certificate: 'arn:aws:iam::486247037159:server-certificate/xbterminal'
      - elb_port: 80
        instance_port: 8080
        elb_protocol: HTTP
    - health_check:
      target: 'HTTP:8443/en/'
    - attributes:
      cross_zone_load_balancing:
        enabled: true
    - security_groups:
      - sg-7c9fc318
    - cnames:
      - name: api.xbterminal.io
        zome: xbterminal.io
        ttl: 60
