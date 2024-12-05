#
# Be sure to run `pod lib lint PCMasonry.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PCMasonry'
  s.version          = '1.0.1'
  s.summary          = 'A short description of PCMasonry.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = %{
      Privacy
      Masonry is a light-weight layout framework which wraps AutoLayout with a nicer syntax.
      Masonry has its own layout DSL which provides a chainable way of describing your
      NSLayoutConstraints which results in layout code which is more concise and readable.
      Masonry supports iOS and Mac OSX.
    }

  s.homepage         = 'https://github.com/gitHaH/PCMasonry'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhangmengmeng' => '1006520276@qq.com' }
  s.source           = { :git => 'https://github.com/gitHaH/PCMasonry.git', :tag => '1.0.1' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'PCMasonry/Classes/**/*'
  
  s.resource_bundles = {
     'PCMasonry' => ['PCMasonry/Assets/*.xcprivacy']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation', 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
