# Installs 7zip using Chocolatey
#
# @author Dan
class profile::windows::software::notepadplusplus (
  $version = '7.3'
)
{
  package { 'notepadplusplus':
    ensure          => $version,
    provider        => 'chocolatey',
  }
}
