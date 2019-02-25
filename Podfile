platform :ios, '11.0'
workspace 'CondorArchitecture.xcworkspace'
use_frameworks!

def rxPods
	pod 'RxSwift'
	pod 'RxCocoa'
	pod 'RxDataSources'
end

target 'CondorArchitecture' do
	project 'CondorArchitecture.xcproject'

end

target 'CoreLayer' do
	project 'CoreLayer/CoreLayer.xcproject'

end

target 'DataLayer' do
	project 'DataLayer/DataLayer.xcproject'
	pod 'Alamofire'
end
