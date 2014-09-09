require_relative '../spec_helper'

describe 'pgbadger::install' do
  subject do
    ChefSpec::Runner.new do |node|
      node.set[:postgresql][:defaults][:server][:version] = '9.2'
    end.converge(described_recipe)
  end

  it { is_expected.to include_recipe 'apt' }

  it do
    is_expected.to add_apt_repository('obs_mrtns').with(
      uri: 'http://download.opensuse.org/repositories/home:/evilmartians:/ubuntu/precise',
      distribution: './',
      key: 'http://download.opensuse.org/repositories/home:/evilmartians:/ubuntu/precise/Release.key'
    )
  end

  it { is_expected.to install_package 'pgbadger' }
end
