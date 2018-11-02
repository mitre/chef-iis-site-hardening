#
# Cookbook:: .
# Recipe:: services_and_features
#
# Copyright:: 2018, The Authors, All Rights Reserved.

powershell_script 'V-76773' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.applicationHost/sites/siteDefaults/limits" -name MaxConnections -value #{node['iis']['MaxConnections']} -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76775, V-76813' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.web/sessionState" -name mode -value InProc -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76777' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.web/sessionState" -name cookieless -value UseCookies -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76779, V-76781, V-76809' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/security/access" -name sslFlags -value 'Ssl,SslRequireCert' -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76805' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.web/trust" -name level -value Full -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76817' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/security/requestFiltering/requestLimits" -name maxUrl -value #{node['iis']['maxUrl']} -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76819' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/security/requestFiltering/requestLimits" -name maxAllowedContentLength -value #{node['iis']['maxAllowedContentLength']} -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76821' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/security/requestFiltering/requestLimits" -name maxQueryString -value #{node['iis']['maxQueryString']} -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76823' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/security/requestFiltering" -name allowHighBitCharacters -value True -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76825' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/security/requestFiltering" -name allowDoubleEscaping -value False -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76827' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/security/requestFiltering/fileExtensions" -name allowUnlisted -value False -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76829' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/directoryBrowse" -name enabled -value False -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76831' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/defaultDocument" -name enabled -value True -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76835' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/httpErrors" -name errorMode -value DetailedLocalOnly -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76837' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.web/compilation" -name debug -value True -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76839' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.applicationHost/applicationPools/applicationPoolDefaults/processModel/idleTimeout" -name TotalMinutes -value #{node['iis']['IdleTimeoutTotalMinutes']} -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76841' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.web/sessionState/timeout" -name TotalMinutes -value #{node['iis']['ConnectionTimeoutTotalMinutes']} -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76867' do
  code <<-EOH
  Set-WebConfigurationProperty -filter system.applicationHost/applicationPools/applicationPoolDefaults/recycling/periodicRestart -name requests -value #{node['iis']['requestLimit']} -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76869' do
  code <<-EOH
  Set-WebConfigurationProperty -filter system.applicationHost/applicationPools/applicationPoolDefaults/recycling/periodicRestart -name memory -value #{node['iis']['virtualMemoryLimit']} -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76871' do
  code <<-EOH
  Set-WebConfigurationProperty -filter system.applicationHost/applicationPools/applicationPoolDefaults/recycling/periodicRestart -name privateMemory -value #{node['iis']['privateMemory']} -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76873' do
  code <<-EOH
  Set-WebConfigurationProperty -filter system.applicationHost/applicationPools/applicationPoolDefaults/recycling -name logEventOnRecycle -value 141 -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76875' do
  code <<-EOH
  Set-WebConfigurationProperty -filter system.applicationHost/applicationPools/applicationPoolDefaults -name queueLength -value #{node['iis']['queueLength']} -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76877' do
  code <<-EOH
  Set-WebConfigurationProperty -filter system.applicationHost/applicationPools/applicationPoolDefaults/processModel -name pingingEnabled -value True -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76879' do
  code <<-EOH
  Set-WebConfigurationProperty -filter system.applicationHost/applicationPools/applicationPoolDefaults/failure -name rapidFailProtection -value True -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76881' do
  code <<-EOH
  Set-WebConfigurationProperty -filter system.applicationHost/applicationPools/applicationPoolDefaults/failure -name rapidFailProtectionInterval -value #{node['iis']['failureInterval']} -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76883' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/serverRuntime" -name alternateHostName -value #{node['iis']['alternateHostName']} -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end
