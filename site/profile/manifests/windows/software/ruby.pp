# Installs Ruby
#
# @author Dan
class profile::windows::software::ruby (
  $version = '2.1.6'
)
{

  package { 'ruby':
    ensure    => '2.1.6',
    provider  => 'chocolatey',
  }
}
