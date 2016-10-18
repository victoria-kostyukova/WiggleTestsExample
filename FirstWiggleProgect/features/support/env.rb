require "rubygems"
require "bundler/setup"
Bundler.require

Before do
  @browser = Watir::Browser.new :chrome
end

After do
  @browser.close
end