# Installs WinLogBeat (https://www.elastic.co/products/beats/winlogbeat)
#
# @author Dan
class profile::windows::software::winlogbeat (
  $proxy_server         = hiera('base::proxy_server',''),
  $elasticsearch_server = hiera('base::elasticsearch_server'),
)
{

  class { 'winlogbeat':
    outputs    => {
      'elasticsearch' => {
        'hosts'       => [ $elasticsearch_server],
      },
    },
    event_logs => {
      'Application' => { 'ignore_older' => '72h', 'include_xml' => 'true' },
      'Security'    => { 'ignore_older' => '72h', 'include_xml' => 'true' },
      'System'      => { 'ignore_older' => '72h', 'include_xml' => 'true' },
    },
    proxy_address => $proxy_server
  }
}
