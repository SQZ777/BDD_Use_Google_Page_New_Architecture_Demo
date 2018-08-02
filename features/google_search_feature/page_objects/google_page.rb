require_relative "./android/android_google_implements.rb"
require_relative "./desktop/desktop_google_implements.rb"
require_relative "./ios/ios_google_implements.rb"
require_relative "../../base/platform.rb"

class GooglePage
  def initialize(platform)
    @platform = platform
    extend DesktopGoogleImplements if @platform.platform.eql? "desktop"
    extend AndroidGoogleImplements if @platform.platform.eql? "android"
    extend IosGoogleImplements if @platform.platform.eql? "iOS"
    puts @platform.platform
  end

  def go_to_this_page
    @platform.go_to_this_page
  end

  def search(search_item)
    @platform.search(search_item)
  end

  def see(search_item)
    @platform.see(search_item)
  end
end
