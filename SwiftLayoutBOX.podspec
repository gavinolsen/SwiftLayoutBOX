#
# Be sure to run `pod lib lint SwiftLayoutBOX.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftLayoutBOX'
  s.version          = '0.0.2'
  s.summary          = 'Chainable layout for swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Chainable layout for swift. Original code by Boris Oks
                       DESC

  s.homepage         = 'https://github.com/gavinolsen/SwiftLayoutBOX'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ols15015@byui.edu' => 'ols15015@byui.edu' }
  s.source           = { :git => 'https://github.com/gavinolsen/SwiftLayoutBOX.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SwiftLayoutBOX/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SwiftLayoutBOX' => ['SwiftLayoutBOX/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.swift_version = '5.0.0'
end
