#
# Cookbook Name:: pgbadger
# Recipe:: install
#
# Author: Maxim Filatov <bregor@evilmartians.com>
# Copyright 2014, Evil Martians
#
# Some rights reserved - Redistribute As You Please
#

include_recipe 'apt'

apt_repository 'mrtns' do
  uri 'http://ppa.launchpad.net/evl.ms/evil/ubuntu'
  distribution node['lsb']['codename']
  components %w(main)
  key 'B7AD0003'
  keyserver 'keyserver.ubuntu.com'
end

package 'pgbadger'
