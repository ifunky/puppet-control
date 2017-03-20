# Installs Metricbeat (https://www.elastic.co/products/beats/metricbeat)
#
# @author Dan
class profile::windows::software::metricbeat (
  $proxy_server         = hiera('base::proxy_server',''),
  $elasticsearch_server = hiera('base::elasticsearch_server'),
)
{

  class { 'metricbeat':
    modules => {
      'system' => {
        'metricsets' => ['cpu', 'core', 'diskio', 'filesystem', 'fsstat', 'memory', 'network', 'process'],
        'enabled'    => 'true',
        'period'     => '10s',
      },
    },
    outputs => {
      'elasticsearch' => {
        'hosts' => [ $elasticsearch_server ],
      }
    },
    proxy_address => $proxy_server
  }
}
