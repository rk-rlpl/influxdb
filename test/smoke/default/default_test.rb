# # encoding: utf-8

# Inspec test for recipe influxdb::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# Tests to Check

# Ports Open : 8086, 8088
# Service running inflexd


describe port(8086) do
  it { should be_listening }
end

describe port(8088) do
  it { should be_listening}
end

describe service('influxdb') do
  it { should be_running }
  it { should be_enabled }
end
