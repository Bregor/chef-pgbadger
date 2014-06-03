require_relative '../spec_helper'

describe 'chef-pgbadger::web' do
  let(:chef_run) do
    ChefSpec::Runner.new {|node| node.set[:postgresql][:defaults][:server][:version] = '9.2'}.converge(described_recipe)
  end

  it 'should create passwd file anyway' do
    expect(chef_run).to create_template '/var/lib/postgresql/pg_reports/.passwd'
  end

  context 'with data bag exists' do
    require 'chefspec/server'

    before do
      ChefSpec::Server
        .create_data_bag('pgbadger_users',
                         {
                           'bregor' => {'id' => 'bregor','password' => 'abc123'}
                         })
    end

    it 'stores users in passwd file' do
      expect(chef_run).to render_file('/var/lib/postgresql/pg_reports/.passwd')
        .with_content(/bregor.+/)
    end
  end

end
