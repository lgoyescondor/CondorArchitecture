platform :ios, '11.0'
workspace 'CondorArchitecture.xcworkspace'
use_frameworks!

def rxPods
	pod 'RxSwift'
	pod 'RxCocoa'
end

target 'CondorArchitecture' do
	project 'CondorArchitecture.xcproject'
  pod 'Alamofire'
  rxPods
end

target 'CoreLayer' do
	project 'CoreLayer/CoreLayer.xcproject'
  rxPods
end

target 'DataLayer' do
	project 'DataLayer/DataLayer.xcproject'
	pod 'Alamofire'
end
