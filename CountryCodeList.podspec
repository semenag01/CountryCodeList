Pod::Spec.new do |s|
  s.name             = 'CountryCodeList'
  s.version          = '0.1.4'
  s.summary          = 'A library which can be used as datasource for country phone extesnsion list.'
  s.homepage         = 'https://github.com/maksimpetrovskycorewill/CountryCodeList'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Max Petrovsky' => 'byzyn4ik@gmail.com' }
  s.source           = { :git => 'https://github.com/maksimpetrovskycorewill/CountryCodeList.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/CountryCodeList/**/*.swift'
  s.resources = 'Sources/CountryCodeList/Resources/**/*'
end
