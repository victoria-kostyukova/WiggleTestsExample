class User

  attr_accessor :title, :surname, :email, :gender, :firstName, :password

  def initialize(title, gender)
    @email, @title, @firstName, @surname, @gender, @password = self.generate_email, title, @timestamp_login, @timestamp_login, gender, "123456"
  end

  def generate_timestamp_login
    @timestamp_login = (Time.now.to_f * 1000).to_i.to_s + "wiggle"
        return @timestamp_login
  end

  def generate_email
    @email = generate_timestamp_login + "@gmail.com"
    return @email
  end

  def to_s
    return "User email: "+ @email +", title: "+ @title +", firstName: "+ @firstName +", surname: "+ @surname +", gender: "+ @gender +", password: "+ @password
  end


end