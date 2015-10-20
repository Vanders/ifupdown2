#
# Cookbook Name:: cumulus-test
# Recipe:: bonds
#
# Copyright 2015, Cumulus Networks
#
# All rights reserved - Do Not Redistribute
#

# swp11-30

# Bond with defaults
cumulus_bond 'bond0' do
  slaves ['swp11-12', 'swp14']
end

# Bond, over-ride all defaults
cumulus_bond 'bond1' do
  slaves ['swp15-16']
  ipv4 ['10.0.0.1/24', '192.168.1.0/16']
  ipv6 ['2001:db8:abcd::/48']
  alias_name 'bond number 1'
  addr_method 'static'
  min_links 2
  mode 'balance-alb'
  miimon 99
  xmit_hash_policy 'layer2'
  lacp_rate 9
  lacp_bypass_allow 1
  lacp_bypass_period 30
  lacp_bypass_all_active 1
  mtu 9000
  # ifquery doesn't seem to like clagd related parameters on an interface?
  # clag_id 1
  virtual_ip '192.168.100.1'
  vids ['1-4094']
  pvid 1
  virtual_mac '11:22:33:44:55:FF'
  virtual_ip '192.168.20.1'
  mstpctl_portnetwork true
  mstpctl_portadminedge true
  mstpctl_bpduguard true
end

# Single & multiple IPv4 & IPv6 addresses
cumulus_bond 'bond3' do
  slaves ['swp17-18']
  ipv4 ['192.168.50.1']
end

cumulus_bond 'bond4' do
  slaves ['swp19-20']
  ipv4 ['192.168.50.2','192.168.50.3','192.168.50.4']
  ipv6 ['2001:db8:abcd::a','2001:db8:5678::b']
end
