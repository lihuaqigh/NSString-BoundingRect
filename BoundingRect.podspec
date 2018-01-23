#
#  Be sure to run `pod spec lint BoundingRect.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = 'BoundingRect'
s.version      = '0.0.1'
s.summary      = 'Right BoundingRect for Label'
s.homepage     = 'https://github.com/lihuaqigh/BoundingRect.git'

s.license      = { :type => 'MIT', :file => 'LICENSE' }

s.authors      = { 'lihuaqigh' => '13261591518@163.com' }

s.platform     = :ios, '8.0'

s.source       = { :git => 'https://github.com/lihuaqigh/BoundingRect.git', :tag => s.version.to_s }
s.source_files        = 'BoundingRect/**/*.{h,m}'
s.public_header_files = 'BoundingRect/**/*.{h}'

end
