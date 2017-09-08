$user = "jjp"
$git_folder = "/home/${user}/git-repos"

#clone vim pluins (requires vim installed)

#apt packages
package { 'vim':
  ensure => 'latest',
}
package { 'i3':
  ensure => 'latest',
}
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
package { 'vim-pathogen':
  ensure => 'latest',
}

#change shell
#create config symlinks

file { "/home/${user}/.Xdefaults":
  ensure => 'link',
  target => "${git_folder}/mydotfiles/Xdefaults",
  owner => $user,
  group => $user,
}

file { "/home/${user}/.vimrc":
  ensure => 'link',
  target => "${git_folder}/mydotfiles/vim/vimrc",
  owner => $user,
  group => $user,
}

file { "/home/${user}/Pictures/planet_express.jpg":
  ensure => 'link',
  target => "${git_folder}/mydotfiles/backgrounds/planet_express.jpg",
  owner => $user,
  group => $user,
}
