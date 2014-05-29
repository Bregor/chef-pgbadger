default["pgbadger"]["databases"]  = []
default["pgbadger"]["data_dir"]   = "/var/www/pg_reports"
default["pgbadger"]["log_path"]   = "/var/log/postgresql/postgresql-#{node[:postgresql][:defaults][:server][:version]}-main.log"
default["pgbadger"]["rhytm"]      = "hourly"
default['pgbadger']['user']       = 'root'
