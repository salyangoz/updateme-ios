#
# Be sure to run `pod lib lint UpdateMe.podspec' to ensure this is a
# valid spec before submitting.
# [!] No `Podfile' found in the project directory.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
#
Pod::Spec.new do |s|
  s.name             = 'UpdateMe'
  s.version          = '0.0.1'
  s.summary          = 'A powerful force update library for iOS(Swift)'


# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A powerful force update library for Swift. Alert dialog will show when you need to force update your application. You can set this configuration with Firebase Remote anytime, anywhere.'

  s.homepage		 = 'https://github.com/salyangoz/updateme-ios'
  s.license         	 = 'MIT'
  s.author         	 = { 'Salyangoz Co.' => 'info@salyangoz.com.tr' }
  s.source          	 = { :git => 'https://github.com/salyangoz/updateme-ios.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/salyangoz'

  s.ios.deployment_target = '10.0'

  s.source_files = 'UpdateMe/Classes/**/*'
  
  s.resources = 'UpdateMe/Assets/**/*'

  # Specify what libraries this depends on.
   s.libraries = [
     'c++', # FirebaseAnalytics.
     'icucore', # FirebaseDatabase.
     'sqlite3', # FirebaseAnalytics.
     'z', # FirebaseAnalytics.
   ]
   
   s.frameworks = [
       'UIKit',
     ]
     
     s.vendored_frameworks = [
       # Firebase Analytics.
        'UpdateMe/Frameworks/Firebase/Analytics/FirebaseAnalytics.framework',
        'UpdateMe/Frameworks/Firebase/Analytics/FirebaseInstanceID.framework',
        'UpdateMe/Frameworks/Firebase/Analytics/GoogleUtilities.framework',
        'UpdateMe/Frameworks/Firebase/Analytics/nanopb.framework',
        'UpdateMe/Frameworks/Firebase/Analytics/FirebaseNanoPB.framework',
        'UpdateMe/Frameworks/Firebase/Analytics/GoogleToolboxForMac.framework',
        'UpdateMe/Frameworks/Firebase/Analytics/FirebaseCore.framework',
        'UpdateMe/Frameworks/Firebase/Analytics/FirebaseCoreDiagnostics.framework',

        # RemoteConfig.
       'UpdateMe/Frameworks/Firebase/RemoteConfig/FirebaseRemoteConfig.framework',
       'UpdateMe/Frameworks/Firebase/RemoteConfig/Protobuf.framework',
     ]
     
     # LDFLAGS required by Firebase dependencies.
      s.pod_target_xcconfig = {
        'OTHER_LDFLAGS' => '$(inherited) -ObjC',
      }
     s.dependency 'SCLAlertView'
end
