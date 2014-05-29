#
# Cookbook Name:: pgbadger
# Recipe:: install
#
# Copyright 2014, Evil Martians
#
# Some rights reserved - Redistribute As You Please
#


project_name = value_for_platform(
    "ubuntu" => {
      "14.04"   => "home:/evilmartians:/ubuntu14.04",
      "default" => "home:/evilmartians:/ubuntu"
    }
  )

include_recipe "apt"

apt_repository "obs_mrtns" do
  uri "http://download.opensuse.org/repositories/#{project_name}/#{node['lsb']['codename']}"
  distribution "./"
  key "http://download.opensuse.org/repositories/#{project_name}/#{node['lsb']['codename']}/Release.key"
end

package "pgbadger"
