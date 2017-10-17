forge "https://forgeapi.puppetlabs.com"

# IMPPORTANT!
# For Windows make sure you have fixed the Ruby SSL error: http://ifunky.net/2017/10/17/ruby-on-windows-ssl-certificate-verify-failed/
#

# Windows forge modules
mod "puppetlabs/stdlib", "4.20.0"
mod "puppetlabs/registry", "1.1.4"
mod "puppetlabs/chocolatey", "3.0.0"
mod "puppetlabs/powershell", "2.1.2"
mod "puppetlabs/reboot", "1.2.1"
mod "puppetlabs/inifile", "2.0.0"
mod "puppetlabs/iis", "4.1.1"
mod "puppetlabs/dsc", "1.4.0"
mod "puppetlabs/acl", "2.0.1"
mod "puppet/windowsfeature", "3.0.0"
mod "puppet/windows_env", "2.3.0"
mod "puppet/download_file", "2.1.0"
mod "lwf/remote_file", "1.1.3"

# Pull request pending for proxy server support
#mod 'filebeat',
#  :git => "https://github.com/pcfens/puppet-filebeat",
#  :ref => 'v0.10.2'

mod 'filebeat',
  :git => "https://github.com/ifunky/puppet-filebeat",
  :ref => 'add-proxy-server-support'

mod 'winlogbeat',
  :git => "https://github.com/ifunky/puppet-winlogbeat",
  :ref => 'add-proxy-server-support'

mod 'metricbeat',
  :git => "https://github.com/ifunky/ifunky-metricbeat"


# System modules
mod 'base',
  :git => "https://github.com/ifunky/ifunky-base.git"

mod 'windows',
    :git => "https://github.com/ifunky/ifunky-windows.git"

mod 'octopus',
    :git => "https://github.com/ifunky/ifunky-octopus.git"

mod 'teamcity',
    :git => "https://github.com/ifunky/ifunky-teamcity.git"

mod 'proxy',
    :git => "https://github.com/ifunky/ifunky-proxy.git"

mod 'nsclient',
    :git => "https://github.com/ifunky/puppet-nsclient.git",
    :ref => 'proxy_server'

mod 'proxy',
    :git => "https://github.com/ifunky/ifunky-proxy.git"