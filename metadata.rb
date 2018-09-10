name             'pgbadger'
maintainer       'Evil Martians'
maintainer_email 'bregor@evilmartians.com'
license          'MIT'
description      'Installs/Configures pgbadger'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.5'

supports         'ubuntu'

depends          'apt'
depends          'cron'

chef_version     '>= 14'

source_url 'https://github.com/evilmartians/chef-pgbadger'
issues_url 'https://github.com/evilmartians/chef-pgbadger/issues'
