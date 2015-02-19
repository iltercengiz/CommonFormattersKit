Pod::Spec.new do |s|
    s.name             = "CommonFormattersKit"
    s.version          = "0.1.0"
    s.summary          = "Common formatters we use in almost every project"
    s.description      = <<-DESC
                       Common formatters we use in almost every project. So this pod is developed to make life easier.
                       Formatters include (at least for now):
                       
                       * Date formatter
                       * Phone number formatter
                       DESC
    s.homepage         = "https://github.com/iltercengiz/CommonFormattersKit"
    s.license          = 'MIT'
    s.author           = { "Ilter Cengiz" => "iltercengiz@yahoo.com" }
    s.source           = { :git => "https://github.com/iltercengiz/CommonFormattersKit.git", :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/iltercengiz'
    
    s.platform     = :ios, '7.0'
    s.requires_arc = true
    
    s.source_files = 'Pod/Classes/**/*'
    
    s.dependency 'libPhoneNumber-iOS', '~> 0.8.2'
end
