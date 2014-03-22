Pod::Spec.new do |s|

  s.name         = "MSMCategories"
  s.version      = "0.0.1"
  s.summary      = "A set of categories I find useful in day to day iOS app development."
  s.homepage     = "https://github.com/greenisus/msm-categories"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Mike Mayo" => "greenisus@gmail.com" }
  s.social_media_url = "http://twitter.com/greenisus"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/greenisus/msm-categories.git", :branch => "master" }
  s.source_files  = '*.{h,m}'

end
