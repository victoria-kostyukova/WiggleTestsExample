require "rubygems"
require "bundler/setup"
Bundler.require

dir_path = "snapshots"

Before do
  @browser = Watir::Browser.new ENV['BROWSER'].downcase.to_sym
end

After do |scenario|
  if scenario.failed?
    # @browser.screenshot.save ("#{@@filename}.png")
    time = Time.now.strftime('%Y_%m_%d_%H_%M_%S_')
    name_of_scenario = time + scenario.name.gsub(/\s+/, "_").gsub("/","_") + '_' + ENV['BROWSER'].downcase
    file_path = File.expand_path(dir_path)+'/'+name_of_scenario +'.png'
    @browser.screenshot.save (file_path)
    puts "Name of snapshot is #{name_of_scenario}"
    puts "Scenario:: #{scenario.name}"
  end
  @browser.close
end