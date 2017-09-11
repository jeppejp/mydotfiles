# does not change path in i3 config
$user = "jjp"
$git_folder = "/home/${user}/git-repos"



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

file { "/home/${user}/.config/i3/":
  ensure => 'directory',
  owner => $user,
  group => $user,
}

file { "/home/${user}/.config/i3/config":
  ensure => 'link',
  target => "${git_folder}/mydotfiles/i3/i3_config",
  owner => $user,
  group => $user,
  require => File["/home/${user}/.config/i3/"],
}

file { "/home/${user}/Pictures/planet_express.jpg":
  ensure => 'link',
  target => "${git_folder}/mydotfiles/backgrounds/planet_express.jpg",
  owner => $user,
  group => $user,
}

file { "/etc/alternatives/x-terminal-emulator":
  ensure => 'link',
  target => "/usr/bin/urxvt",
  require => Package['rxvt-unicode-256color'],
}

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

#install vim vundle
exec { "vim-vundle":
  require => Package['vim'],
  command => "/usr/bin/git clone https://github.com/VundleVim/Vundle.vim.git /home/${user}/.vim/bundle/Vundle.vim",
  user => "${user}",
  creates => "/home/${user}/.vim/bundle/Vundle.vim/README.md"
}
