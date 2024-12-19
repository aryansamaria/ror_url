# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# seeds.rb

# Create Users
user1 = User.create(username: 'Alice', password: 'password')
user2 = User.create(username: 'Bob', password: 'password')

# Ensure Users are saved before proceeding with child records
if user1.persisted? && user2.persisted?
  # Create Links (Assuming you have a Link model)
  link1 = Link.create(url: 'https://example.com', title: 'Example Link')

  # Ensure Link is saved before creating Comments
  if link1.persisted?
    # Create Comments
    link1.comments.create(user: user1, body: 'Great link!')
    link1.comments.create(user: user2, body: 'Very interesting!')
  else
    puts "Link not created"
  end
else
  puts "Users not created"
end
