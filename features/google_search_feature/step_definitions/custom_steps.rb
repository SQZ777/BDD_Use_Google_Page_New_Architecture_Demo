require "selenium-cucumber"
require_relative "../page_objects/google_page.rb"

Before do
  @google_page = GooglePage.new($start_up_platform)
end

Given("I go to Google web site") do
  @google_page.go_to_this_page
end

When("I search {string}") do |search_item|
  @google_page.search(search_item)
end

Then("I see {string}") do |search_item|
  @google_page.see(search_item)
end
