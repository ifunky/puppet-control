node default {
  notify { 'Im a windows 2012 server!!': }


  ini_setting { 'pluginsync':
    ensure   => present,
    path     => 'C:/ProgramData/PuppetLabs/puppet/etc/puppet.conf',
    section  => 'main',
    setting  => 'pluginsync',
    value    => 'true',
  }

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