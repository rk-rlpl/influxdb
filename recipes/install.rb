#
# Cookbook:: influxdb
# Recipe:: install
#
# Copyright:: 2017, The Authors, All Rights Reserved.
if node['platform'] == 'ubuntu'

  package 'apt-transport-https'

  apt_repository 'influxdb' do
    uri        "https://repos.influxdata.com/#{node['Ubuntu']['DISTRIB_ID']}"
    key        'https://repos.influxdata.com/influxdb.key'
    components ["#{node['Ubuntu']['DISTRIB_CODENAME']}" , 'stable']
  end

  apt_update 'all platforms' do
    action:update 
  end

  package 'influxdb'

  service 'influxdb' do
    action [:enable, :start]
  end

end

if node['platform'] == 'centos'

  yum_repository 'influxdb' do
    description 'Influxdb Repo'
    baseurl 'https://repos.influxdata.com/rhel/$releasever/$basearch/stable'
    gpgkey 'https://repos.influxdata.com/influxdb.key'
    action :create
  end

  package 'influxdb'

  service 'influxdb' do
    action [:enable, :start]
  end

end
