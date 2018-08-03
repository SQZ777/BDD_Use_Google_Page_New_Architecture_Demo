require_relative "./android/android_google_implements.rb"
require_relative "./desktop/desktop_google_implements.rb"
require_relative "./ios/ios_google_implements.rb"
require_relative "../../base/platform.rb"

class GooglePage
  def initialize
    extend DesktopGoogleImplements if $start_up_platform.platform.eql? "desktop"
    extend AndroidGoogleImplements if $start_up_platform.platform.eql? "android"
    extend IosGoogleImplements if $start_up_platform.platform.eql? "iOS"
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
