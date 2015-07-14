#
# Be sure to run `pod lib lint DTAsyncIO.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DTAsyncIO"
  s.version          = "0.2.17"
  s.summary          = "Async Data Management in iOS"
  s.description      = <<-DESC
# DTAsyncIO

Async Data Management in iOS
                       DESC
  s.homepage         = "https://github.com/DTHENG/DTAsyncIO"
  s.license          = 'MIT'
  s.author           = { "DTHENG" => "fender5289@gmail.com" }
  s.source           = { :git => "https://github.com/DTHENG/DTAsyncIO.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = '*.{h,m}'
  s.resource_bundles = {
    'DTAsyncIO' => ['*.png']
  }
  s.dependency 'DTObservable', '0.4.4'
end
