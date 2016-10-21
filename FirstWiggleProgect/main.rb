require_relative 'features/objects/user'
require 'yaml'

class Main
  users = YAML.load(File.open("users.yml"))
  # puts users.keys[0]
  # puts users[users.keys[0]]
  # puts users.keys[0][0]
  # puts users.keys[0][1]
  # puts users.keys[0][2]
  # puts users.keys[0][2][users.keys[0][2].keys[0]]
  # puts users[users.keys[0][2].keys[0]]
  # puts users.keys[0]
  # puts users.keys[0][0]
  # puts users.keys[0][0]["user"]["title"]
  # puts users.keys[0][0]["user"]["gender"]

  array = []
  $/="\n\n"
  File.open("users.yml", "r").each do |object|
    array << YAML::load(object)
  end

  array.each do |object|
    puts object.class
    puts object.to_s
  end
  puts array[0].email

  puts ENV['BROWSER']


  # puts users.to_s
  # @user = users[0].login
  # puts @user
end

# yaml example
# ? - 1
# - 2
# - 3: three
# :
#     some digits