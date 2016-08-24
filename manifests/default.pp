node default {

  $role = $::role

  notify { "Im a $role server!!": }

  include $role
}