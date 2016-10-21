require "rubygems"
require "bundler/setup"
Bundler.require

class WiggleMainPage

  attr_accessor :wiggle_customer_bar

  def initialize(browser)
    @browser = browser
    @wiggle_customer_bar = WiggleCustomerBar.new(@browser)
  end

  def click_link_register
    @wiggle_customer_bar.click_link_register
  end

  def lable_welcome_name_text
    @wiggle_customer_bar.lable_welcome_name.text
  end

  def sign_out
    @wiggle_customer_bar.link_sign_out.when_present.click
    @wiggle_customer_bar.link_not_you.when_present.click
  end

end