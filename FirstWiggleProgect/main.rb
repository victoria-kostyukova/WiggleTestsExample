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
  puts users.keys[0]
  puts users.keys[0][0]
  puts users.keys[0][0]["user"]["title"]
  puts users.keys[0][0]["user"]["gender"]
  @user = User.new(users.keys[0][0]["user"]["title"], users.keys[0][0]["user"]["gender"])
  puts @user.to_s
end

# yaml example
# ? - 1
# - 2
# - 3: three
# :
#     some digits