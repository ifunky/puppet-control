# Installs Git
#
# @author Dan
class profile::windows::software::git (
  $version = '2.11.0.3'
)
{

  package { 'git':
    ensure          => $version,
    install_options => ["-params", '"','/GitAndUnixToolsOnPath','"'],
    provider        => 'chocolatey',
  }
}
