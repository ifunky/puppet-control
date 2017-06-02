class role::teamcity_agent () {
  include ::profile::windows::software::dotnet35
  include ::profile::windows::software::dotnet452
  include ::profile::windows::software::chrome
  include ::profile::windows::software::notepadplusplus
  include ::profile::windows::software::windows71sdk
  include ::profile::windows::software::windows80sdk
  include ::profile::windows::software::sqlserever2012commandline
  include ::profile::windows::software::git
  include ::profile::windows::software::dotnet451developerpack
  include ::profile::windows::software::ruby
  include ::profile::windows::software::rubydevkit
  include ::profile::windows::software::bundler
  include ::profile::windows::software::buildtools2013
  include ::profile::windows::software::buildtools2015
  include ::profile::windows::software::dotnet451developerpack
  include ::profile::windows::software::mvc4
  include ::profile::windows::software::awscli
  include ::profile::teamcity::agent
}