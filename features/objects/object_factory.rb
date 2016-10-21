class ObjectFactory
  def self.build(object, *args)
    case object
      when :user
        User.new(*args)
      when :user_with_generate_email
        User.user_with_generate_email(*args)
      when :customer_bar
        WiggleCustomerBar.new(*args)
      when :main_page
        WiggleMainPage.new(*args)
      when :reg_login_page
        WiggleRegLoginPage.new(*args)
    end
  end



end