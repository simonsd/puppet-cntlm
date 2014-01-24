# Class: cntlm::params
#
# This class defines default parameters used by the main module class cntlm
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to cntlm class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class cntlm::params {
  # ## Application related parameters

  $package = $::operatingsystem ? {
    default => 'cntlm',
  }

  $service = $::operatingsystem ? {
    default => 'cntlm',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'cntlm',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'cntlm',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/cntlm.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0600',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/cntlm',
    default                   => '/etc/sysconfig/cntlmd',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/cntlm/cntlm.pid',
  }

  # TODO: but where are cntlm's logs ?
  $log_dir = $::operatingsystem ? {
    default => '/var/log/cntlm',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/cntlm/cntlm.log',
  }

  $port = '3128'
  $protocol = 'tcp'

  $username = 'testuser'
  $domain = 'corp-uk'
  $password = undef
  $passLM = undef
  $passNT = undef
  $passNTLMv2 = undef

  $workstation = undef
  $socks5proxy = undef
  $socks5user = undef
  $proxies = []

  # General Settings
  $my_class = ''
  $source = ''
  $template = 'cntlm/cntlm.conf.erb'
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  # ## General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
