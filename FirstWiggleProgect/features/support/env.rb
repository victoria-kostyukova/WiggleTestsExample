require "rubygems"
require "bundler/setup"
Bundler.require

dir_path = "snapshots"

# Before do
#   @browser = Browser.new("chrome")
# end

# After do
#   @browser.close
# end

After do |scenario|
  if scenario.failed?
    # @browser.screenshot.save ("#{@@filename}.png")
    time = Time.now.strftime('%Y_%m_%d_%H_%M_%S_')
    name_of_scenario = time + scenario.name.gsub(/\s+/, "_").gsub("/","_")
    file_path = File.expand_path(dir_path)+'/'+name_of_scenario +'.png'
    @browser.screenshot.save (file_path)
    puts "Name of snapshot is #{name_of_scenario}"
    puts "Scenario:: #{scenario.name}"
  end
  @browser.close
end

# After do |scenario|
#   #Check, scenario is failed?
#   if(scenario.failed?)
#     time = Time.now.strftime('%Y_%m_%d_%Y_%H_%M_%S_')
#     name_of_scenario = time + scenario.name.gsub(/\s+/, "_").gsub("/","_")
#     puts "Name of snapshot is #{name_of_scenario}"
#     file_path = File.expand_path(dir_path)+'/'+name_of_scenario +'.png'
#     page.driver.browser.save_screenshot file_path
#     puts "Snapshot is taken"
#     puts "#===========================================================#"
#     puts "Scenario:: #{scenario.name}"
#     puts "#===========================================================#"
#   end
# end