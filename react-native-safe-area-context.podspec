require 'json'
require_relative "../react-native/scripts/react_native_pods.rb"

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "react-native-safe-area-context"
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platforms    = { :ios => "9.0", :tvos => "9.2" }

  s.source       = { :git => "https://github.com/th3rdwave/react-native-safe-area-context.git", :tag => "v#{s.version}" }
  s.source_files  = "ios/**/*.{h,m}"

  s.dependency 'React-Core'

  use_react_native_codegen!(s, {
    :react_native_path => "../react-native",
    :js_srcs_dir => "./src",
    :modules_output_dir => "./ios/RNSafeAreaContextSpec"
  })
end
