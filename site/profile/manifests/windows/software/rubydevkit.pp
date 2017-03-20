# Installs Ruby Dev Kit
#
# @author Dan
class profile::windows::software::rubydevkit ()
{

  $devkit_install_folder = 'C:\tools\DevKit2'
  $devkit_config_file    = "$devkit_install_folder\\config.yml"

  package { 'ruby2.devkit':
    ensure    => installed,
    provider  => 'chocolatey',
  }

  file { $devkit_config_file:
    ensure             => file,
    content            =>'
---
- c:/tools/ruby21
',
    source_permissions => ignore,
    notify             => Exec['install ruby devkit'],
    require            => Package['ruby2.devkit'],
  }

  # The Ruby dev kit doesn't work very well - lets finish the job
  exec { 'install ruby devkit':
    command     => "cd $devkit_install_folder;. ruby $devkit_install_folder\\dk.rb install",
    provider    => powershell,
    refreshonly => true,
  }
}
