require_relative "./android_google_elements.rb"

module AndroidGoogleImplements
  include AndroidGoogleElements

  def go_to_this_page
    puts "Am I this android page?"
    puts "I have load this android page!"
  end

  def search(search_item)
    puts "enter something... %s in android" % search_item
    puts use_android_elements
  end

  def see(search_item)
    puts "i've see the %s in android" % search_item
  end
end
