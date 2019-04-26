#
# Be sure to run `pod lib lint FFLimitTextView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name               = 'FFLimitTextView'
  s.version            = '0.0.1'
  s.summary         = '一个限制输入并实时显示字数情况的小控件'
  s.description      = '一个限制输入并实时显示字数情况的小控件，忽略中文未选中文字时的字数计算'
  s.homepage      = 'https://github.com/fanxiaoApple/FFLimitTextView'
  s.license           = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fanxiaoApple' => '547900997@qq.com' }
  s.source           = { :git => 'https://github.com/fanxiaoApple/FFLimitTextView.git', :tag => s.version.to_s }
  s.platform        = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.source_files = 'FFLimitTextView/Classes/**/*'
  s.frameworks = 'UIKit','CoreFoundation','QuartzCore','CoreGraphics'
end
