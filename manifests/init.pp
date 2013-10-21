# Class: libmongoc
#
# This module manages the libmongoc libraries. 

# [Remember: No empty lines between comments and class definition]
class libmongoc (
  $ensure = 'installed'
) {
  file {"/opt/libmongoc-pkgs": ensure => directory }
  file {"/opt/libmongoc-pkgs/libmongoc-dev_0.7-3_amd64.deb":
    ensure => present,
    source => "puppet:///modules/libmongoc/libmongoc-dev_0.7-3_amd64.deb",
    require => File["/opt/libmongoc-pkgs"]
  }
  file {"/opt/libmongoc-pkgs/libmongoc_0.7-3_amd64.deb":
    ensure => present,
    source => "puppet:///modules/libmongoc/libmongoc_0.7-3_amd64.deb",
    require => File["/opt/libmongoc-pkgs"]
  }
  package{"libmongoc_0.7-3_amd64.deb":
    provider => dpkg,
    source => "/opt/libmongoc-pkgs/libmongoc_0.7-3_amd64.deb",
    require => File["/opt/libmongoc-pkgs/libmongoc_0.7-3_amd64.deb"],
    ensure => $ensure
  }
  package{"libmongoc-dev_0.7-3_amd64.deb":
    provider => dpkg,
    source => "/opt/libmongoc-pkgs/libmongoc-dev_0.7-3_amd64.deb",
    require => [File["/opt/libmongoc-pkgs/libmongoc-dev_0.7-3_amd64.deb"],Package["libmongoc_0.7-3_amd64.deb"]],
    ensure => $ensure
  }
}
