require 'serverspec'

# Required by serverspec
set :backend, :exec


describe package('syslog-ng') do
  it { should be_installed }
end
describe service('syslog-ng') do
  it { should be_enabled }
  it { should be_running }
end


describe command('loggen -Q -i  -s 1000 -I 1 -P -n 100000  127.0.0.1 5129 ') do
  its(:stdout) { should_not match /Error/ }
  its(:stderr) { should_not match /Error/ }
  its(:stderr) { should match /average rate/ }
  its(:exit_status) { should eq 0 }
end

describe file('/var/log/xbterminal/pre-init/127.0.0.1/terminal.log') do
  it { should be_file }
end

describe command('echo | openssl s_client -connect  127.0.0.1:5128 -tls1_2 ') do
  its(:stdout) { should match /Verify return code: 18/ }
  its(:stderr) { should match /read:errno=0/}
  its(:exit_status) { should eq 0 }
end
