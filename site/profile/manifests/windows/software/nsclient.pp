# Install and configures the NSClient
#
# Allowed hosts can be set in heira  as follows: ['10.1.2.3']
#
# @author Dan
class profile::windows::software::nsclient (
  $allowed_hosts = ['*'],
  $proxy_server  = hiera('base::proxy_server',''))
{

  class { nsclient:
    allowed_hosts => $allowed_hosts,
    proxy_server  => $proxy_server
  }

}