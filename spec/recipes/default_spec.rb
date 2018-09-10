require_relative '../spec_helper'

describe 'pgbadger::default' do
  platform 'ubuntu', '18.04'

  override_attributes['postgresql']['defaults']['server']['version'] = '9.6'
  override_attributes['pgbadger']['databases'] = ['pgbadger_test_db']

  it do
    is_expected.to create_directory('/var/lib/postgresql/pg_reports/pgbadger_test_db').with(
      mode: '0755',
      owner: 'root',
      recursive: true,
    )
  end

  it do
    is_expected.to create_cron_d('pgbadger_pgbadger_test_db_hourly_report').with(
      predefined_value: '@hourly',
      command: '/usr/bin/pgbadger -q -I /var/log/postgresql/postgresql-9.6-main.log -O /var/lib/postgresql/pg_reports/pgbadger_test_db -d pgbadger_test_db',
      user: 'root',
    )
  end
end
