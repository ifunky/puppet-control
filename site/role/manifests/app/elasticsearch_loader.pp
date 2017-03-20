# Role for the ElasticSearch Loader
#
# @author Dan
class role::app::elasticsearch_loader () inherits role::app {
  include ::profile::windows::software::filebeat
  include ::profile::windows::software::winlogbeat
  include ::profile::windows::software::metricbeat
}
