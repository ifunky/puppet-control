# Base Windows profile class containing core config that every Windows server will receive.
#
# @author Dan
class profile::windows::base {

  ini_setting { 'report':
    ensure   => present,
    path     => 'C:/ProgramData/PuppetLabs/puppet/etc/puppet.conf',
    section  => 'main',
    setting  => 'report',
    value    => 'true',
  }

  ini_setting { 'autoflush':
    ensure   => present,
    path     => 'C:/ProgramData/PuppetLabs/puppet/etc/puppet.conf',
    section  => 'main',
    setting  => 'autoflush',
    value    => 'true',
  }


}
