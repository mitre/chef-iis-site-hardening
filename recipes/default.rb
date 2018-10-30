#
# Cookbook:: chef_iis_site_hardening
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

powershell_script 'V-76773' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.applicationHost/sites/siteDefaults/limits" -name MaxConnections -value 4294967295
  EOH
end

powershell_script 'V-76775' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.web/sessionState" -name mode -value InProc
  EOH
end

powershell_script 'V-76777' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.web/sessionState" -name cookieless -value UseCookies
  EOH
end

powershell_script 'V-76779, V-76781, V-76809' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/security/access" -name sslFlags -value 'Ssl,SslRequireCert'
  EOH
end

powershell_script 'V-76805' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.web/trust" -name level -value Full
  EOH
end