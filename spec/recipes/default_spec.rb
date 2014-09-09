require_relative '../spec_helper'

describe 'pgbadger::default' do
  subject do
    ChefSpec::Runner.new do |node|
      node.set[:postgresql][:defaults][:server][:version] = '9.2'
      node.set[:pgbadger][:databases] = ['pgbadger_test_db']
    end.converge(described_recipe)
  end

  it do
    is_expected.to create_directory('/var/lib/postgresql/pg_reports/pgbadger_test_db').with(
      mode: 0755,
      owner: 'root',
      recursive: true
    )
  end

  it do
    is_expected.to create_cron_d('pgbadger_pgbadger_test_db_hourly_report').with(
      predefined_value: '@hourly',
      command: '/usr/bin/pgbadger -q -I /var/log/postgresql/postgresql-9.2-main.log -O /var/lib/postgresql/pg_reports/pgbadger_test_db -d pgbadger_test_db',
      user: 'root'
    )
  end
end
