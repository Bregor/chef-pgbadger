require_relative '../spec_helper'

describe 'pgbadger::install' do
  subject do
    ChefSpec::Runner.new do |node|
      node.set[:postgresql][:defaults][:server][:version] = '9.2'
    end.converge(described_recipe)
  end

  it { is_expected.to include_recipe 'apt' }

  it do
    is_expected.to add_apt_repository('mrtns').with(
      uri: 'http://ppa.launchpad.net/evl.ms/evil/ubuntu',
      distribution: 'precise',
      components: ['main'],
      key: 'B7AD0003',
      keyserver: 'keyserver.ubuntu.com'
    )
  end

  it { is_expected.to install_package 'pgbadger' }
end
