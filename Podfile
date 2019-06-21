platform :ios, '9.0'
inhibit_all_warnings!
use_frameworks!

target 'iTunesAlbum' do
  pod 'SDWebImage', '~> 4.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    puts "#{target.name}"
  end
end