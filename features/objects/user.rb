class User

  attr_reader :title, :surname, :email, :gender, :first_name, :password

  def initialize(email, title, first_name, surname, gender, password)
    @email, @title, @first_name, @surname, @gender, @password = email, title, first_name, surname, gender, password
  end

  def self.generate_timestamp_login
    (Time.now.to_f * 1000).to_i.to_s + "wiggle"
  end

  def self.generate_email
    generate_timestamp_login + "@gmail.com"
  end

  def to_s
    "User email: #{@email}, title: #{@title}, firstName: #{@first_name}, surname: #{@surname}, gender: #{@gender}, password: #{@password}"
  end


end

