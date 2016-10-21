Given(/^I am on the wiggle homepage$/) do
  @browser.goto "http://www.wiggle.co.uk/"
  expect(@browser.title).to include("Wiggle")
end

When(/^I register a new user$/) do
  wiggle_main_page = ObjectFactory.build(:main_page, @browser)
  wiggle_reg_login_page = ObjectFactory.build(:reg_login_page, @browser)
  users_array = []
  $/="\n\n"
  File.open("users.yml", "r").each do |object|
    users_array << YAML::load(object)
  end
  @user = ObjectFactory.build(:user, User.generate_email, users_array[0].title, User.generate_timestamp_login, User.generate_timestamp_login, users_array[0].gender, users_array[0].password)
  puts @user
  wiggle_main_page.click_link_register
  wiggle_reg_login_page.register(@user)
  expect(wiggle_main_page.lable_welcome_name_text).to include(@user.gender)
end

Then(/^I can login using user credentials$/) do
  wiggle_main_page = ObjectFactory.build(:main_page, @browser)
  wiggle_reg_login_page = ObjectFactory.build(:reg_login_page, @browser)
  wiggle_main_page.sign_out
  wiggle_reg_login_page.login(@user)
  expect(wiggle_main_page.lable_welcome_name_text).to include(@user.firstName)
end


