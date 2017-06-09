# Role for the Bridge Applicaiton
#
# @author Dan
class role::app::bridge () inherits role::app {
  include ::profile::windows::software::dotnet452
  include ::profile::windows::software::filebeat
  include ::profile::windows::software::winlogbeat
  include ::profile::windows::software::metricbeat
  include ::profile::windows::application::bridge
}
