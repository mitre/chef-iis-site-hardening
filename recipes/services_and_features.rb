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

powershell_script 'V-76779, V-76781, V-76809, V-76851, V-76861' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/security/access" -name sslFlags -value 'Ssl,Ssl128,SslRequireCert' -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76783' do
  code <<-EOH
  Set-WebConfigurationProperty -Filter System.Applicationhost/Sites/SiteDefaults/logfile -Name LogExtFileFlags -Value "Date,Time,ClientIP,UserName,Method,UriQuery,HttpStatus,Referer"
  EOH
end

powershell_script 'V-76785' do
  code <<-EOH
  Set-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter "system.applicationHost/sites/SiteDefaults/logFile" -name "logTargetW3C" -value "File,ETW"
  EOH
end

powershell_script 'V-76789, V-76791' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.applicationHost/sites/siteDefaults/logFile" -name logFormat -value W3C -PSPath "MACHINE/WEBROOT/APPHOST"
  Add-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter "system.applicationHost/sites/SiteDefaults/logFile/customFields" -name "." -value @{logFieldName='Connection';sourceName='Connection';sourceType='RequestHeader'}
  Add-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter "system.applicationHost/sites/SiteDefaults/logFile/customFields" -name "." -value @{logFieldName='Warning';sourceName='Warning';sourceType='RequestHeader'}
  Add-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter "system.applicationHost/sites/SiteDefaults/logFile/customFields" -name "." -value @{logFieldName='HTTP_CONNECTION';sourceName='HTTP_CONNECTION';sourceType='ServerVariable'}
  Add-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter "system.applicationHost/sites/SiteDefaults/logFile/customFields" -name "." -value @{logFieldName='User-Agent';sourceName='User-Agent';sourceType='RequestHeader'}
  Add-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter "system.applicationHost/sites/SiteDefaults/logFile/customFields" -name "." -value @{logFieldName='Authorization';sourceName='Authorization';sourceType='RequestHeader'}
  Add-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter "system.applicationHost/sites/SiteDefaults/logFile/customFields" -name "." -value @{logFieldName='Content-Type';sourceName='Content-Type';sourceType='ResponseHeader'}
  EOH
end

powershell_script 'V-76797' do
  code <<-EOH
  Install-WindowsFeature -Name Web-Url-Auth
  Set-WebConfigurationProperty -filter "system.webServer/security/authentication/anonymousAuthentication" -name enabled -value false -PSPath "MACHINE/WEBROOT/APPHOST"
  Set-WebConfigurationProperty -filter "system.webServer/security/authentication/basicAuthentication" -name enabled -value true -PSPath "MACHINE/WEBROOT/APPHOST"
  Set-WebConfigurationProperty -filter "system.webServer/security/authentication/basicAuthentication" -name defaultLogonDomain -value Administrator -PSPath "MACHINE/WEBROOT/APPHOST"
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

powershell_script 'V-76845' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.ApplicationHost/log/centralW3CLogFile" -name directory -value #{node['iis']['logDirectory']} -PSPath "MACHINE/WEBROOT/APPHOST"
  Set-WebConfigurationProperty -filter "system.ApplicationHost/log/centralW3CLogFile" -name period -value Daily -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76855' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/asp/session" -name keepSessionIdSecure -value True -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76859' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.web/sessionState" -name compressionEnabled -value False -PSPath "MACHINE/WEBROOT/APPHOST"
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
