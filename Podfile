platform :ios, '11.0'
workspace 'CondorArchitecture.xcworkspace'
use_frameworks!

def rxPods
	pod 'RxSwift'
	pod 'RxCocoa'
end

rxPods

target 'CondorArchitecture' do
	project 'CondorArchitecture.xcproject'
  pod 'Alamofire'
end

target 'CoreLayer' do
	project 'CoreLayer/CoreLayer.xcproject'
end

target 'DataLayer' do
	project 'DataLayer/DataLayer.xcproject'
	pod 'Alamofire'
end
