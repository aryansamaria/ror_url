# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.create(username: "Badal", password:"pass12345")

user = User.first

Link.create(title: "xyzlink", url: "https://best.aliexpress.com/?af=amp1250&dp=128319984627625984&mfadid=adm&aff_fcid=f4611e207da3482fa9ff13553c457dfa-1734663626587-05689-byrlillA&aff_fsk=byrlillA&aff_platform=link-c-tool&sk=byrlillA&aff_trace_key=f4611e207da3482fa9ff13553c457dfa-1734663626587-05689-byrlillA&terminal_id=17b0dcf33f4646c1b33d94fe4a5a194e&afSmartRedirect=y")

User.create([{username: "Piyush", password: "piyush1212"},
{username: "joshi", password: "joshi09876"}])

Link.create([{title: "popup", url: "https://semantic-ui.com/modules/popup.html"},
{title: "msg", url: "https://chatgpt.com"}])

puts "seeding complete!"