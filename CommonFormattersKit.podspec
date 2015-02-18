#
# Be sure to run `pod lib lint CommonFormattersKit.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "CommonFormattersKit"
  s.version          = "0.1.0"
  s.summary          = "A short description of CommonFormattersKit."
  s.description      = <<-DESC
                       An optional longer description of CommonFormattersKit

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/iltercengiz/CommonFormattersKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Ilter Cengiz" => "iltercengiz@yahoo.com" }
  s.source           = { :git => "https://github.com/iltercengiz/CommonFormattersKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/iltercengiz'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'CommonFormattersKit' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'libPhoneNumber-iOS', '~> 0.8.2'
end
