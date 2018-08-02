require_relative "./desktop_google_elements.rb"

module DesktopGoogleImplements
  include DesktopGoogleElements

  def go_to_this_page
    navigate_to("https://www.google.com")
  end

  def search(search_item)
    enter_text(:xpath, search_item, search_txt_input)
    sleep 1
    click(:xpath, search_btn)
  end

  def see(search_item)
    actual_item = get_element_text(:xpath, search_result)
    raise "actual result does not match and your actual result is:%s" % actual_item unless actual_item.downcase.include? search_item.downcase
  end
end
