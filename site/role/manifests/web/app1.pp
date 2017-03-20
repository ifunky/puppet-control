# Web server class
#
# @author Dan
class role::web::app1 () inherits role::web {
  include profile::windows::web::iiscore
  include profile::windows::web::app1
  include profile::windows::application::distributionservices
}
