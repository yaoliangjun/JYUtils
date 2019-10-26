#
# Be sure to run `pod lib lint JYUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JYUtils'
  s.version          = '0.3.0'
  s.summary          = 'JYUtils是一个包含了常用的工具类、分类和控件的快速开发工具包。'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        JYUtils是一个包含了常用的工具类、分类和控件的快速开发工具包，可加快APP开发速度。
                       DESC

  s.homepage         = 'https://github.com/yaoliangjun/JYUtils'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yaoliangjun' => '913736093@qq.com' }
  s.source           = { :git => 'https://github.com/yaoliangjun/JYUtils.git', :tag => s.version.to_s }

  s.platform     = :ios, "8.0"

  s.public_header_files = 'JYUtils/**/JYUtils.h'
  s.source_files = 'JYUtils/**/JYUtils.h'

  s.subspec 'JYCategory' do |category|
      category.source_files = 'JYUtils/**/JYCategory/*.{h,m}'
      category.public_header_files = 'JYUtils/**/JYCategory/*.h'
  end

  s.subspec 'JYUtilities' do |utils|
      utils.source_files = 'JYUtils/**/JYUtilities/*.{h,m}'
      utils.public_header_files = 'JYUtils/**/JYUtilities/*.h'
      utils.dependency 'MBProgressHUD'
  end

  s.subspec 'JYWidget' do |widget|
      widget.source_files = 'JYUtils/**/JYWidget/*.{h,m}'
      widget.public_header_files = 'JYUtils/**/JYWidget/*.h'
      widget.dependency 'SDWebImage'
  end

end
