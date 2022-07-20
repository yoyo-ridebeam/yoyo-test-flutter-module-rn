require 'json'

def use_flutter_module_rn! (options={})
  package = JSON.parse(File.read(File.join(__dir__, "../package.json")))
  packageName = package['name']
  prefix = options[:path] ||= "../node_modules/#{packageName}"

  pod 'Flutter', :path => "#{prefix}/build/ios/framework/Release/Flutter.podspec"
  pod 'FlutterModuleRn-Debug',
    :configuration => 'Debug',
    :path => "#{prefix}/ios-rn/Podspecs/FlutterModuleRn-Debug.podspec"
  pod 'FlutterModuleRn-Release',
    :configuration => 'Release',
    :path => "#{prefix}/ios-rn/Podspecs/FlutterModuleRn-Release.podspec"
end