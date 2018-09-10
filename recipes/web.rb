#
# Cookbook Name:: pgbadger
# Recipe:: web
#
# Author: Maxim Filatov <bregor@evilmartians.com>
# Copyright 2014, Evil Martians
#
# Some rights reserved - Redistribute As You Please
#

template "#{node['pgbadger']['data_dir']}/index.html" do
  source 'index.html.erb'
  owner node['pgbadger']['user']
  group node['pgbadger']['user']
  mode '0644'
  variables(databases: node['pgbadger']['databases'])
end

template "#{node['pgbadger']['data_dir']}/style.css" do
  source 'style.css.erb'
  owner node['pgbadger']['user']
  group node['pgbadger']['user']
  mode '0644'
end

begin
  pgbadger_users = data_bag(:pgbadger_users).map { |user| data_bag_item('pgbadger_users', user) }
rescue StandardError
  pgbadger_users = []
end

template "#{node['pgbadger']['data_dir']}/.passwd" do
  source 'passwd.erb'
  owner node['pgbadger']['user']
  group node['pgbadger']['user']
  mode '0644'
  variables(users: pgbadger_users)
end
