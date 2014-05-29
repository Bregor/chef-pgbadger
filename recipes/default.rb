#
# Cookbook Name:: pgbadger
# Recipe:: default
#
# Author: Maxim Filatov <bregor@evilmartians.com>
# Copyright 2014, Evil Martians
#
# Some rights reserved - Redistribute As You Please
#

node['pgbadger']['databases'].each do |db|
  directory "#{node['pgbadger']['data_dir']}/#{db}" do
    mode 00755
    owner node['pgbadger']['user']
    action :create
    recursive true
  end

  cron_d "pgbadger_#{db}_#{node['pgbadger']['rhytm']}_report" do
    predefined_value "@#{node['pgbadger']['rhytm']}"
    command "/usr/bin/pgbadger -q -I #{node['pgbadger']['log_path']} -O #{node['pgbadger']['data_dir']}/#{db} -d #{db}"
    user node['pgbadger']['user']
  end

end
