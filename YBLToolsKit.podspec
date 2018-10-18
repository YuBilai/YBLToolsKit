Pod::Spec.new do |s|
  s.name         = "YBLToolsKit"
  s.version      = "0.0.1"
  s.summary      = "yubilai’s extension tools kit"
  s.description  = <<-DESC
                   yubilai's extension tools kit!
                   DESC
  s.homepage     = "https://github.com/YuBilai/YBLToolsKit"
  s.license      = "MIT"
  s.author             = { "yblMac" => "1229961064@qq.com" }
  s.source       = { :git => "https://github.com/YuBilai/YBLToolsKit.git", :tag => "#{s.version}" }

  s.source_files  = "YBLToolsKit", "YBLToolsKit/**/*.{h,m}"
  s.public_header_files = "YBLToolsKit/**/YBLToolsKit.h"
  s.requires_arc = true
end
