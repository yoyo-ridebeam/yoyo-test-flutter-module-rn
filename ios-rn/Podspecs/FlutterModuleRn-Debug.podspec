require 'json'

package = JSON.parse(File.read(File.join(__dir__, '../../package.json')))

Pod::Spec.new do |s|
  s.name = "FlutterModuleRn-Debug"
  s.summary = 'FlutterModuleRn-Debug'
  s.description = package['description']
  s.license = package['license']
  s.homepage = package['homepage']

  s.version = package['version']
  s.source = { :http => "file:///#{__dir__}/../../build/ios/framework/Debug.zip"}
# You can reference sources as a git repository instead:
  # s.source = { :git => "https://github.com/yoyo-ridebeam/yoyo-test-flutter-module-rn.git" } 
  s.authors      = { package['author']['name'] => package['author']['url'] }

  s.preserve_paths = "**/*.xcframework"
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' } 
  s.platforms    = { :ios => "11.0" }
  s.swift_version = '5.0'
  s.source_files = "**/*.{swift,h,m}"
  s.vendored_frameworks = '**/*.xcframework'
  s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => "'${PODS_ROOT}/FlutterModuleRn-Debug'"}
  s.requires_arc = true
end