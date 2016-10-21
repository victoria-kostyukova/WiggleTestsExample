class WiggleCustomerBar
  attr_accessor :link_sign_out, :link_register, :lable_welcome_name, :link_not_you, :browser

  def initialize(browser)
    @browser = browser
    @link_register = @browser.element(:xpath => "//a[@id=\"btnJoinLink\"]")
    @link_sign_out = @browser.element(:xpath => "//a[@id=\"btnSignOut\"]")
    @link_not_you = @browser.element(:xpath => "//a[@id=\"btnNotYou\"]")
    @lable_welcome_name = @browser.element(:xpath => "//li[@class=\"bem-nav__item--account-status\"]/span")
  end

  def click_link_register
    @link_register.when_present.click
  end
end