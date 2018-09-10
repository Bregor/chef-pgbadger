require_relative '../spec_helper'

describe 'pgbadger::install' do
  platform 'ubuntu', '18.04'
  override_attributes['postgresql']['defaults']['server']['version'] = '9.6'
  it { is_expected.to install_package 'pgbadger' }
end
