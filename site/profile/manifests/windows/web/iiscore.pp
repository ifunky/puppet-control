# Installs and configures the minimum settings to function as a web server.
#
# @param timezone Required. Hiera lookup for timezone setting
#
# @author Dan
class profile::windows::web::iiscore(
  $root_web_path = hiera('base::root_web_path', 'c:\inetpub\wwwroot'),
  $web_logs_path = hiera('base::web_logs_path', 'c:\inetpub\logs')
)
{

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

  exec { 'Update site default log location' :
    command   => "Set-WebConfigurationProperty -Filter System.Applicationhost/Sites/SiteDefaults/logfile -Name directory -Value '$web_logs_path'",
    onlyif    => "if ( (Get-WebConfiguration –filter system.applicationhost/sites/sitedefaults/logfile | Select-Object -ExpandProperty directory) -eq '$web_logs_path') { exit 1} else { exit 0}",
    require   => [Windowsfeature['Web-WebServer'], File[$web_logs_path]],
    logoutput => true,
    provider  => powershell,
  }

  exec { 'Update server default log location' :
    command   => "Set-WebConfigurationProperty -Filter system.applicationhost/log/centralW3CLogFile -Name directory -Value '$web_logs_path'",
    onlyif    => "if ( (Get-WebConfiguration –filter system.applicationhost/log/centralW3CLogFile | Select-Object -ExpandProperty directory) -eq '$web_logs_path') { exit 1} else { exit 0}",
    require   => [Windowsfeature['Web-WebServer'], File[$web_logs_path]],
    logoutput => true,
    provider  => powershell,
  }

  $w3c_fields = 'Date,Time,ClientIP,UserName,SiteName,ComputerName,ServerIP,Method,UriStem,UriQuery,HttpStatus,Win32Status,BytesSent,BytesRecv,TimeTaken,ServerPort,UserAgent,Referer,ProtocolVersion,Host,HttpSubStatus'
  exec { 'Update default w3c logging fields' :
    command   => "Set-WebConfigurationProperty -Filter System.Applicationhost/Sites/SiteDefaults/logfile -Name LogExtFileFlags -Value '$w3c_fields'",
    onlyif    => "if ( (Get-WebConfiguration –filter System.Applicationhost/Sites/SiteDefaults/logfile | Select-Object -ExpandProperty LogExtFileFlags) -eq '$w3c_fields') { exit 1} else { exit 0}",
    require   => [Windowsfeature['Web-WebServer']],
    logoutput => true,
    provider  => powershell,
  }

  # Custom log fields
  exec { 'Add x-forwarded-for custom field' :
    command   => "Add-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter 'system.applicationHost/sites/siteDefaults/logFile/customFields' -name '.' -value @{logFieldName='X-Forwarded-For';sourceName='X-Forwarded-For';sourceType='RequestHeader'}",
    onlyif    => 'if ( (Get-WebConfigurationProperty -Filter "//sites/siteDefaults/logFile/customFields/add[@logFieldName=\'X-Forwarded-For\']" -PSPath "IIS:" -Name logFieldName) -eq $null) { exit 0 } else { exit 1 }',
    require   => [Windowsfeature['Web-WebServer']],
    logoutput => true,
    provider  => powershell,
  }

  exec { 'Add x-forwarded-proto custom field' :
    command   => "Add-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter 'system.applicationHost/sites/siteDefaults/logFile/customFields' -name '.' -value @{logFieldName='X-Forwarded-Proto';sourceName='X-Forwarded-Proto';sourceType='RequestHeader'}",
    onlyif    => 'if ( (Get-WebConfigurationProperty -Filter "//sites/siteDefaults/logFile/customFields/add[@logFieldName=\'X-Forwarded-Proto\']" -PSPath "IIS:" -Name logFieldName) -eq $null) { exit 0 } else { exit 1 }',
    require   => [Windowsfeature['Web-WebServer']],
    logoutput => true,
    provider  => powershell,
  }

}
