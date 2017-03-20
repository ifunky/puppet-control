# Installs FileBeat (https://www.elastic.co/products/beats/filebeat)
#
# @author Dan
class profile::windows::software::filebeat (
  $application_name     = undef,
  $log_path             = hiera('base::app_logs_path'),
  $proxy_server         = hiera('base::proxy_server',''),
  $elasticsearch_server = hiera('base::elasticsearch_server'),
)
{

  if empty($application_name) {
    fail("You must supply an applicaiton name")
  }

  class { 'filebeat':
    major_version => 5,
    conf_template => 'filebeat/filebeat5.yml.erb',
    outputs => {
      'elasticsearch' => {
        'hosts' => [
          $elasticsearch_server,
        ],
      },
    },
    logging => {
      'level'     => error,
      'to_files'  => true,
      'to_syslog' => false,
    },
    proxy_address => $proxy_server
  }

  filebeat::prospector { 'log':
    paths    => [
      'D:\RBILogs\*.log',
    ],
    doc_type => 'log',
    fields   => {"applicationName" => $application_name}
  }

}
