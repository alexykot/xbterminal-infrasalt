require 'serverspec'

# Required by serverspec
set :backend, :exec


describe package('salt-master') do
  it { should be_installed }
end
describe service('salt-master') do
  it { should be_enabled }
  it { should be_running }
end

describe package('salt-api') do
  it { should be_installed }
end
describe service('salt-api') do
  it { should be_enabled }
  it { should be_running }
end

describe command('curl -sq 127.0.0.1:8000 | python -mjson.tool') do
  its(:stdout) { should match /Welcome/ }
end

describe command('curl -sq 127.0.0.1:8000/login  -d username=salt-xbt-test -d password=test-password -d eauth=pam') do
  its(:stdout) { should match /token/ }
end

describe command('curl -sq 127.0.0.1:8000 -k --key /etc/nginx/ssl/localhost/localhost.key --cert /etc/nginx/ssl/localhost/localhost.crt | python -mjson.tool') do
  its(:stdout) { should match /Welcome/ }
end

describe command('curl -sq 127.0.0.1:8000/login -k --key /etc/nginx/ssl/localhost/localhost.key --cert /etc/nginx/ssl/localhost/localhost.crt -d username=salt-xbt-test -d password=test-password -d eauth=pam') do
  its(:stdout) { should match /token/ }
end
