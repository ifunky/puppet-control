# App server base role.  Internal use only.
#
# @author Dan
class role::app () inherits role  {
  include ::profile::windows::application::base
}
