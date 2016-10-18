Given(/^I am on the wiggle homepage in "([a-z]{,7})" browser$/) do |term|
  @browser = Browser.new(term).browser
  @browser.goto "http://www.wiggle.co.uk/"
  expect(@browser.title).to include("Wiggle")
end

When(/^I register a new user$/) do
  wiggle_main_page = Wiggle_main_page.new(@browser)
  wiggle_reg_login_page = Wiggle_reg_login_page.new(@browser)
  users = YAML.load(File.open("users.yml"))
  @user = User.new(users.keys[0][0]["user"]["title"], users.keys[0][0]["user"]["gender"])
  wiggle_main_page.link_register.when_present.click
  wiggle_reg_login_page.radio_register_option.when_present.set
  wiggle_reg_login_page.text_field_register_email.set(@user.email)
  wiggle_reg_login_page.select_list_register_title.select(@user.title)
  wiggle_reg_login_page.text_field_register_first_name.set(@user.firstName)
  wiggle_reg_login_page.text_field_register_surname.set(@user.surname)
  wiggle_reg_login_page.select_list_register_gender.select(@user.gender)
  wiggle_reg_login_page.text_field_register_password.set(@user.password)
  wiggle_reg_login_page.button_register.click
  expect(wiggle_main_page.lable_welcome_name.text).to include(@user.gender)
end

Then(/^I can login using user credentials$/) do
  wiggle_main_page = Wiggle_main_page.new(@browser)
  wiggle_reg_login_page = Wiggle_reg_login_page.new(@browser)
  wiggle_main_page.link_sign_out.when_present.click
  wiggle_main_page.link_not_you.when_present.click
  wiggle_reg_login_page.text_field_login_email.set(@user.email)
  wiggle_reg_login_page.text_field_login_password.set(@user.password)
  wiggle_reg_login_page.button_login.click
  expect(wiggle_main_page.lable_welcome_name.text).to include(@user.firstName)
end

# pages + return elements not locators
# cucumber hooks (env.rb) -> browser
#  "wiggleautomation+oiqweiqhwe@gmail.com"
# test data to yaml file

# push to git

