Pod::Spec.new do |s|
  s.name         = "Leomon"
  s.version      = "0.0.1"
  s.summary      = "Leomon is a swifty wrapper for Lviv Public Transport Monitoring System API."
  s.homepage     = "https://github.com/yuriyhanysh/Leomon"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Yuriy Hanysh" => "yuriy.hanysh@gmail.com" }
  s.social_media_url   = "http://twitter.com/yuriyhanysh"
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/yuriyhanysh/Leomon.git", :tag => "#{s.version}" }
  s.source_files  = "Source", "Source/*.{h,swift}"
  s.framework  = "Foundation"

  s.dependency "Decodable"
end
