# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.create(username: 'Badal', password: 'password123')
User.create(username: 'Aakash', password: 'password321')


link1 = Link.create(title: 'first link', url: 'https://www.linkedin.com/')


link1.comments.create(user_id: User.first.id, body: 'Great link!')
link1.comments.create(user_id: User.last.id, body: 'Interesting!')
