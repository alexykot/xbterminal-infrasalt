nginx:
  config:
    client: True
    ssl:
      domain: 'xbthq.co.uk'
      key : |
        -----BEGIN RSA PRIVATE KEY-----
        MIIEogIBAAKCAQEA7k1xbhRyKecHf4gJxH9OmxLmRVaz/fowHGaag7bphNyPOE7Y
        1SyrHzEQynt6QYxu8YUCcMV6+eVU+l56KA5Gl8BkfleAfEhzKjo=
        -----END RSA PRIVATE KEY-----
      crt: |
        -----BEGIN CERTIFICATE-----
        MIID8jCCAtqgAwIBAgIUeQ0KoBhBu4cqy7jq6j0LuCUCDp0wDQYJKoZIhvcNAQEL
        yx3tgApIThz1eyeIaB5l0Jzv8LOnGtDbZ1imls2n8ZYwbQQmbcXfsvbGdFGLbMsx
        7aFznTup
        -----END CERTIFICATE-----
