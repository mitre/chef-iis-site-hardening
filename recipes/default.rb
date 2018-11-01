#
# Cookbook:: chef_iis_site_hardening
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


include_recipe 'iis::default'
include_recipe 'chef_iis_85_hardening::services_and_features'
