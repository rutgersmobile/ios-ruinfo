Pod::Spec.new do |s|
  s.name         = "ruinfo"
  s.version      = "2.2.0"
  s.summary      = "RU-Info channel for the Rutgers Mobile client, iOS."

  s.description  = <<-DESC
                   The RU-Info channel for the Rutgers Mobile client, iOS
                   DESC

  s.homepage     = "http://github.com/rutgersmobile/ios-ruinfo"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "Russ Frank" => "russ.frank@rutgers.edu" }
  s.source       = { :git => "https://github.com/rutgersmobile/ios-ruinfo.git", :tag => "2.2.0" }

  s.source_files  = 'info/RUInfoTableViewController.*'
  s.requires_arc = true

  s.platform      = :ios, '7.0'
  s.dependency 'TOWebViewController'

end
