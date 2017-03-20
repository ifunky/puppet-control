# Web application class
#
# @author Dan
class profile::windows::web::app1 {

  $web_resources = [ 'd:\\WebResources', 'd:\\WebResources\\EGI', 'd:\\WebResources\\EGI\\TownReports' ]

  windowsfeature { [ 'NET-WCF-HTTP-Activation45' ]:
    ensure  => present,
  }

  file { $web_resources:
    ensure             => directory,
  }

  acl{ $web_resources:
    permissions => [
      {identity => 'IIS_IUSRS', rights => ['write']}
    ],
    require => File[$web_resources],

  }

  class { 'windows::web::config':
    site_def_name  => 'egi'
  }
}
