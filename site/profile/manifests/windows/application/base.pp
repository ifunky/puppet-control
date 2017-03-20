# Application base class
#
# @author Dan
class profile::windows::application::base (
  $log_path = hiera('base::app_logs_path')
)
{
  file { $log_path:
    ensure             => directory,
  }
}
