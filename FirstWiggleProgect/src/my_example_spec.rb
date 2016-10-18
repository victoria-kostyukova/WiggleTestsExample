require "rubygems"
require "bundler/setup"
Bundler.require

describe 'My behaviour' do
  # let(:browser) { @browser ||= Watir::Browser.new :chrome }
  # before { browser.goto "http://google.com" }
  # after { browser.close }

  it 'should do something' do

    Selenium::WebDriver::Chrome.driver_path="../chromedriver.exe"
    browser = Watir::Browser.new :chrome

    # browser = Watir::Browser.start "www.google.com", :firefox

    browser.goto "http://google.com"
    browser.text_field(:name => "q").set("watir")
    browser.
    browser.button(:xpath => "//input[contains(@name, \"btnK\")]").click
    browser.div(:id => "resultStats").wait_until_present
    browser.title.should == "watir - Пошук Google"

    browser.close

    # Selenium::WebDriver::Chrome.driver_path="../chromedriver.exe"
    # driver = Selenium::WebDriver.for :chrome
    # driver.navigate.to "http://google.com"
    #
    # element = driver.find_element(:name, 'q')
    # element.send_keys "Hello WebDriver!"
    # element.submit
    #
    # puts driver.title
    #
    # driver.quit
  end
end