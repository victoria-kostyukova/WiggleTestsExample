class Browser

  attr_reader :browser

  def initialize(browser_name)
    case browser_name
      when "chrome"
        @browser = Watir::Browser.new :chrome
      when "firefox"
        @browser = Watir::Browser.new :firefox
    end
  end
end