Pod::Spec.new do |s|
  s.name         = "SwiftPromise"
  s.version      = "0.1.0"
  s.summary      = "A minimal Promise library."
  s.description  = <<-DESC
Use this library to create a thenable Promise.
                   DESC
  s.homepage     = "https://github.com/rolandoasmat/SwiftPromise"
  s.license      = "MIT"
  s.author             = { "Rolando Asmat" => "rolandoasmat@gmail.com" }
  s.social_media_url   = "https://twitter.com/Rolando_Asmat"
  s.platform     = :ios, '9.0'
  s.source       = { :git => "https://github.com/rolandoasmat/SwiftPromise.git", :tag => "#{s.version}" }
  s.source_files  = "SwiftPromise/SwiftPromise"
  s.swift_version = '4.0'
end