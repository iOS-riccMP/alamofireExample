
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '12.0'
use_frameworks!

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
    end
  end
end

target 'NetworkCapas' do

    pod 'Alamofire', '~> 5.2'


end
