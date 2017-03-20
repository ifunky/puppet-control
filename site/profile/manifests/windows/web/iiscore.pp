# Installs and configures the minimum settings to function as a web server.
#
# @param timezone Required. Hiera lookup for timezone setting
#
# @author Dan
class profile::windows::web::iiscore(
  $application_host_config = 'C:\Windows\System32\inetsrv\config\applicationhost.config',
  $root_web_path = hiera('base::params::root_web_path', 'c:\inetpub\wwwroot'),
  $web_logs_path = hiera('base::params::web_logs_path', 'c:\inetpub\logs')
)
{

  $p_xml = "[xml](Get-Content '${application_host_config}')"
  $w3c_log = 'configuration."system.applicationHost".log.centralW3CLogFile.directory'
  $site_default = 'configuration."system.applicationHost".sites.siteDefaults.logFile.directory'

  windowsfeature { 'Web-WebServer':
    ensure => present,
    installmanagementtools => true
  }

  windowsfeature { [ 'Web-ISAPI-Filter', 'Web-ISAPI-Ext' ]:
    ensure  => present,
    require => Windowsfeature['Web-WebServer']
  }

  windowsfeature { [ 'Web-Net-Ext45', 'Web-Asp-Net45' ] :
    ensure  => present,
    require => Windowsfeature['Web-WebServer']
  }

  windowsfeature { ['Web-Stat-Compression', 'Web-Dyn-Compression' ] :
    ensure  => present,
    require => Windowsfeature['Web-WebServer'],
  }

  iis::manage_site {'Default Web Site':
    site_name => "Default Web Site",
    ensure  => absent,
    require => Windowsfeature['Web-WebServer'],
  }

  iis::manage_app_pool { '.NET v4.5':
    ensure           => absent,
  }

  iis::manage_app_pool { '.NET v4.5 Classic':
    ensure           => absent,
  }

  iis::manage_app_pool { 'DefaultAppPool':
    ensure           => absent,
  }

  file { $root_web_path:
    ensure             => directory,
    require            => Windowsfeature['Web-WebServer'],
  }

  acl{ $root_web_path:
    permissions => [
      {identity => 'IIS_IUSRS', rights => ['read']}
    ],
    require => File[$root_web_path],

  }

  file { $web_logs_path:
    ensure  => directory,
    require => Windowsfeature['Web-WebServer'],
  }

  acl{ $web_logs_path:
    permissions => [
      {identity => 'IIS_IUSRS', rights => ['read','write']}
    ],
    require => File[$web_logs_path],
  }

  exec { 'Update Server Default LogPath' :
    command  => "\$xml = ${p_xml}; \$xml.${w3c_log} = '${web_logs_path}'; \$xml.save('${application_host_config}')",
    onlyif   => "\$xml = ${p_xml}; if ((\$xml.${w3c_log}) -like '${web_logs_path}') { exit 1 }",
    require  => [Windowsfeature['Web-WebServer'], File[$web_logs_path]],
    provider => powershell,
  }

  exec { 'Update Site Default LogPath' :
    command  => "\$xml = ${p_xml}; \$xml.${site_default} = '${web_logs_path}'; \$xml.save('${application_host_config}')",
    onlyif   => "\$xml = ${p_xml}; if ((\$xml.${site_default}) -like '${web_logs_path}') { exit 1 }",
    require  => [Windowsfeature['Web-WebServer'], File[$web_logs_path]],
    provider => powershell,
  }
}
