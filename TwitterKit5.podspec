Pod::Spec.new do |s|
  s.name = "TwitterKit5"
  s.version = "5.2.2"
  s.summary = "Increase user engagement and app growth."
  s.homepage = "https://github.com/touren/twitter-kit-ios"
  s.documentation_url = "https://github.com/touren/twitter-kit-ios/wiki"
  s.social_media_url = "https://taoren.me"
  s.authors = "Tao Ren"
  s.platform = :ios, "9.0"
  s.source = { :http => "https://github.com/leshkoapps/twitter-kit-ios/releases/download/v#{s.version}/TwitterKit.zip" }
  s.vendored_frameworks = "iOS/TwitterKit.framework"
  s.license = { :type => "Commercial", :text => "Twitter Kit: Copyright Twitter, Inc. All Rights Reserved. Use of this software is subject to the terms and conditions of the Twitter Kit Agreement located at https://dev.twitter.com/overview/terms/twitterkit and the Developer Agreement located at https://dev.twitter.com/overview/terms/agreement. OSS: https://github.com/twitter/twitter-kit-ios/blob/master/OS_LICENSES.md"}
  s.resources = ["iOS/TwitterKit.framework/TwitterKitResources.bundle", "iOS/TwitterKit.framework/TwitterShareExtensionUIResources.bundle"]
  s.frameworks = "CoreText", "QuartzCore", "CoreData", "CoreGraphics", "Foundation", "Security", "UIKit", "CoreMedia", "AVFoundation", "SafariServices"
  s.dependency "TwitterCore", ">= 3.1.0"
  
  s.preserve_paths = 'Frameworks/*.framework'
  twitterkit_framework_os =  "TwitterKit.framework"
  twittercore_framework_os =  "TwitterCore.framework"
  other_frameworks_common =  ["CoreText", "QuartzCore", "CoreData", "CoreGraphics", "Foundation", "Security", "UIKit", "CoreMedia", "AVFoundation", "SafariServices"]
  other_ldflags_os = '$(inherited) -framework ' + other_frameworks_common.join(' -framework ') + ' -framework ' + twitterkit_framework_os +  ' -framework ' + twittercore_framework_os + 
    ' -lz -lstdc++ -lc'
  s.xcconfig     = { 
    'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/TwitterKit5/Frameworks" "$(PODS_ROOT)/TwitterCore/Frameworks"',
    'OTHER_LDFLAGS[sdk=iphoneos*]'  => other_ldflags_os
  }

end
