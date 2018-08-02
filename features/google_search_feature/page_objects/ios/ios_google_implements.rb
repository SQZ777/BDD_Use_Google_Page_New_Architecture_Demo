require_relative "./ios_google_elements.rb"

module IosGoogleImplements
  include IosGoogleElements

  def go_to_this_page
    puts "Am I this iOS page?"
    puts "I have load this iOS page!"
  end

  def search(search_item)
    puts "enter something... %s in iOS" % search_item
    puts use_ios_elements
  end

  def see(search_item)
    puts "i've see the %s in iOS" % search_item
  end
end
