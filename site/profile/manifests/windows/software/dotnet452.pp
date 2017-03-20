# Installs Microsoft .Net 4.5.2
#
# @author Dan
class profile::windows::software::dotnet452 ()
{

  package { 'dotnet4.5.2':
    ensure   => latest,
    provider => 'chocolatey',
  }
}
