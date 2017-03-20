# Sets the system timezone.
#
# @param timezone Required. Hiera lookup for timezone setting
#
# @author Dan
class profile::windows::timezone(
  $timezone = hiera('base::params::timezone',$base::params::timezone)
)
{
  include base

  registry_value { 'HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation\TimeZoneKeyName':
    ensure  => present,
    type    => string,
    data    => $timezone,
    notify => Exec['set_timezone'],
  }

  exec {'set_timezone':
    path => 'C:\\Windows\System32',
    command => "tzutil.exe /s \"$timezone\"",
    refreshonly => true,
  }

}