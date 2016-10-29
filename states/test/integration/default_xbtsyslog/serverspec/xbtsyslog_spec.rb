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

describe file('/var/log/xbterminal/terminal.log') do
  it { should be_file }
end
