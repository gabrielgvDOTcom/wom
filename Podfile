platform :ios, '16.0'
use_frameworks!

target 'wom' do
	pod 'Alamofire'
	pod 'MBProgressHUD'
  pod 'Kingfisher', '~> 7.6.1'
end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
  end
 end
end
