require "rubygems"
require "bundler/setup"
Bundler.require

Given /^I have entered "([^"]*)" into the query$/ do |term|
  # Selenium::WebDriver::Chrome.driver_path="../chromedriver.exe"
  @browser = Watir::Browser.new #:chrome
  @browser.goto "google.com"
  @browser.text_field(:name => "q").set term
end

When /^I click "([^"]*)"$/ do |button_name|
  @browser.button(:name => "btnG").click
end

Then /^I should see some results$/ do
  @browser.div(:id => "resultStats").wait_until_present
  @browser.div(:id => "resultStats").should exist
  @browser.close
end