# Installs 7zip using Chocolatey
#
# @author Dan
class profile::windows::software::seven_zip (
  $version = '16.02.0.20160811'
)
{

  package { '7zip':
    ensure          => $version,
    provider        => 'chocolatey',
  }
}
