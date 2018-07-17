# does not change path in i3 config
$user = "jjp"
$git_folder = "/home/${user}/git-repos"



#apt packages
package { 'feh':
  ensure => 'latest',
}
package { 'fish':
  ensure => 'latest',
}
package { 'fortune-mod':
  ensure => 'latest',
}
package { 'git':
  ensure => 'latest',
}
package { 'rxvt-unicode-256color':
  ensure => 'latest',
}
package {'scrot':
  ensure => 'latest',
}
package {'htop':
  ensure => 'latest',
}
#root ps1
file { "/root/.bashrc":
  content => "PS1=\"\\e[31m[ ROOT ] \\w\\e[0m \""
}
#create config symlinks


file { "/home/${user}/.config/fish/":
  ensure => 'directory',
  owner => $user,
  group => $user,
}

file { "/home/${user}/.config/fish/config.fish":
  ensure => 'link',
  owner => $user,
  group => $user,
  target => "${git_folder}/mydotfiles/fish/config.fish",
  require => File["/home/${user}/.config/fish/"],
}


#change shell
user { "${user}":
  ensure => 'present',
  shell => '/usr/bin/fish',
  require => Package['fish'],
}

