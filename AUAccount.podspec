Pod::Spec.new do |s|
  s.name         = "AUAccount"
  s.version      = "0.1.6"
  s.summary      = "AppUnite support for current user logged in account."
  
  s.homepage     = "http://appunite.com"
  s.license      = 'MIT'
  s.author       = { "emil.wojtaszek" => "emil.wojtaszek@gmail.com" }
  s.source       = { :git => "https://github.com/appunite/AUAccount.git", :tag => s.version.to_s }

  s.platform     = :ios, '5.0'
  s.requires_arc = true

  s.source_files = 'Classes'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'

  s.dependency 'SSKeychain'
end
