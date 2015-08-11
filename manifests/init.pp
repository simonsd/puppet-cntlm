# = Class: cntlm
#
# This is the main cntlm class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, cntlm class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $cntlm_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, cntlm main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $cntlm_source
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, cntlm main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $cntlm_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $cntlm_options
#
# [*service_autorestart*]
#   Automatically restarts the cntlm service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $cntlm_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $cntlm_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $cntlm_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $cntlm_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for cntlm checks
#   Can be defined also by the (top scope) variables $cntlm_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $cntlm_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $cntlm_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $cntlm_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $cntlm_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for cntlm port(s)
#   Can be defined also by the (top scope) variables $cntlm_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling cntlm. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $cntlm_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $cntlm_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $cntlm_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $cntlm_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in cntlm::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of cntlm package
#
# [*service*]
#   The name of cntlm service
#
# [*service_status*]
#   If the cntlm service init script supports status argument
#
# [*process*]
#   The name of cntlm process
#
# [*process_args*]
#   The name of cntlm arguments. Used by puppi and monitor.
#   Used only in case the cntlm process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user cntlm runs with. Used by puppi and monitor.
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $cntlm_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $cntlm_protocol
#
# [*auth*]
#   Specify which auth method to use, defaults to NTLMv2
#
# [*proxies*]
#   Upstream proxies.
#
# See README for usage patterns.
#
class cntlm (
  $my_class            = $::cntlm::params::my_class,
  $source              = $::cntlm::params::source,
  $template            = $::cntlm::params::template,
  $service_autorestart = $::cntlm::params::service_autorestart,
  $options             = $::cntlm::params::options,
  $version             = $::cntlm::params::version,
  $absent              = $::cntlm::params::absent,
  $disable             = $::cntlm::params::disable,
  $disableboot         = $::cntlm::params::disableboot,
  $monitor             = $::cntlm::params::monitor,
  $monitor_tool        = $::cntlm::params::monitor_tool,
  $monitor_target      = $::cntlm::params::monitor_target,
  $puppi               = $::cntlm::params::puppi,
  $puppi_helper        = $::cntlm::params::puppi_helper,
  $firewall            = $::cntlm::params::firewall,
  $firewall_tool       = $::cntlm::params::firewall_tool,
  $firewall_src        = $::cntlm::params::firewall_src,
  $firewall_dst        = $::cntlm::params::firewall_dst,
  $debug               = $::cntlm::params::debug,
  $audit_only          = $::cntlm::params::audit_only,
  $noops               = $::cntlm::params::noops,
  $package             = $::cntlm::params::package,
  $service             = $::cntlm::params::service,
  $service_status      = $::cntlm::params::service_status,
  $process             = $::cntlm::params::process,
  $process_args        = $::cntlm::params::process_args,
  $process_user        = $::cntlm::params::process_user,
  $config_file         = $::cntlm::params::config_file,
  $config_file_mode    = $::cntlm::params::config_file_mode,
  $config_file_owner   = $::cntlm::params::config_file_owner,
  $config_file_group   = $::cntlm::params::config_file_group,
  $config_file_init    = $::cntlm::params::config_file_init,
  $pid_file            = $::cntlm::params::pid_file,
  $log_dir             = $::cntlm::params::log_dir,
  $log_file            = $::cntlm::params::log_file,
  $port                = $::cntlm::params::port,
  $protocol            = $::cntlm::params::protocol,
  $auth                = $::cntlm::params::auth,
  $username            = $::cntlm::params::username,
  $domain              = $::cntlm::params::domain,
  $password            = $::cntlm::params::password,
  $passLM              = $::cntlm::params::passLM,
  $passNT              = $::cntlm::params::passNT,
  $passNTLMv2          = $::cntlm::params::passNTLMv2,
  $workstation         = $::cntlm::params::workstation,
  $socks5proxy         = $::cntlm::params::socks5proxy,
  $socks5user          = $::cntlm::params::socks5user,
  $proxies             = $::cntlm::params::proxies,
) inherits ::cntlm::params {
  $bool_service_autorestart = str2bool($service_autorestart)
  $bool_absent = str2bool($absent)
  $bool_disable = str2bool($disable)
  $bool_disableboot = str2bool($disableboot)
  $bool_monitor = str2bool($monitor)
  $bool_puppi = str2bool($puppi)
  $bool_firewall = str2bool($firewall)
  $bool_debug = str2bool($debug)
  $bool_audit_only = str2bool($audit_only)
  $bool_noops = str2bool($noops)

  # ## Definition of some variables used in the module
  $manage_package = $cntlm::bool_absent ? {
    true  => 'absent',
    false => $cntlm::version,
  }

  $manage_service_enable = $cntlm::bool_disableboot ? {
    true    => false,
    default => $cntlm::bool_disable ? {
      true    => false,
      default => $cntlm::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $cntlm::bool_disable ? {
    true    => 'stopped',
    default => $cntlm::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $cntlm::bool_service_autorestart ? {
    true  => Service[cntlm],
    false => undef,
  }

  $manage_file = $cntlm::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $cntlm::bool_absent == true or $cntlm::bool_disable == true or $cntlm::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $cntlm::bool_absent == true or $cntlm::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $cntlm::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $cntlm::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $cntlm::source ? {
    ''      => undef,
    default => $cntlm::source,
  }

  $manage_file_content = $cntlm::template ? {
    ''      => undef,
    default => template($cntlm::template),
  }

  # ## Managed resources
  package { $cntlm::package:
    ensure => $cntlm::manage_package,
    noop   => $cntlm::bool_noops,
  }

  service { 'cntlm':
    ensure    => $cntlm::manage_service_ensure,
    name      => $cntlm::service,
    enable    => $cntlm::manage_service_enable,
    hasstatus => $cntlm::service_status,
    pattern   => $cntlm::process,
    require   => Package[$cntlm::package],
    noop      => $cntlm::bool_noops,
  }

  file { 'cntlm.conf':
    ensure  => $cntlm::manage_file,
    path    => $cntlm::config_file,
    mode    => $cntlm::config_file_mode,
    owner   => $cntlm::config_file_owner,
    group   => $cntlm::config_file_group,
    require => Package[$cntlm::package],
    notify  => $cntlm::manage_service_autorestart,
    source  => $cntlm::manage_file_source,
    content => $cntlm::manage_file_content,
    replace => $cntlm::manage_file_replace,
    audit   => $cntlm::manage_audit,
    noop    => $cntlm::bool_noops,
  }

  # ## Include custom class if $my_class is set
  if $cntlm::my_class {
    include $cntlm::my_class
  }

  # ## Provide puppi data, if enabled ( puppi => true )
  if $cntlm::bool_puppi == true {
    $classvars = get_class_args()

    puppi::ze { 'cntlm':
      ensure    => $cntlm::manage_file,
      variables => $classvars,
      helper    => $cntlm::puppi_helper,
      noop      => $cntlm::bool_noops,
    }
  }

  # ## Service monitoring, if enabled ( monitor => true )
  if $cntlm::bool_monitor == true {
    if $cntlm::port != '' {
      monitor::port { "cntlm_${cntlm::protocol}_${cntlm::port}":
        protocol => $cntlm::protocol,
        port     => $cntlm::port,
        target   => $cntlm::monitor_target,
        tool     => $cntlm::monitor_tool,
        enable   => $cntlm::manage_monitor,
        noop     => $cntlm::bool_noops,
      }
    }

    if $cntlm::service != '' {
      monitor::process { 'cntlm_process':
        process  => $cntlm::process,
        service  => $cntlm::service,
        pidfile  => $cntlm::pid_file,
        user     => $cntlm::process_user,
        argument => $cntlm::process_args,
        tool     => $cntlm::monitor_tool,
        enable   => $cntlm::manage_monitor,
        noop     => $cntlm::bool_noops,
      }
    }
  }

  # ## Firewall management, if enabled ( firewall => true )
  if $cntlm::bool_firewall == true and $cntlm::port != '' {
    firewall { "cntlm_${cntlm::protocol}_${cntlm::port}":
      source      => $cntlm::firewall_src,
      destination => $cntlm::firewall_dst,
      protocol    => $cntlm::protocol,
      port        => $cntlm::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $cntlm::firewall_tool,
      enable      => $cntlm::manage_firewall,
      noop        => $cntlm::bool_noops,
    }
  }

  # ## Debugging, if enabled ( debug => true )
  if $cntlm::bool_debug == true {
    file { 'debug_cntlm':
      ensure  => $cntlm::manage_file,
      path    => "${settings::vardir}/debug-cntlm",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'
      ),
      noop    => $cntlm::bool_noops,
    }
  }

}
