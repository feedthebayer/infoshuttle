# Create users
50.times do
  User.create!(
    username: Faker::Internet.user_name,
    name: Faker::Name.name,
    premium: [true, false].sample
  )
end
users = User.all
reg_users = User.where(premium: false)
premium_users = User.where(premium: true)

# Create public and private wikis
50.times do
  users.sample.wikis.create!(
    name: Faker::Lorem.sentence,
    public: true,
  )
end

50.times do
  premium_users.sample.wikis.create!(
    name: Faker::Lorem.sentence,
    public: false,
  )
end
wikis = Wiki.all
public_wikis = Wiki.where(public: true)
private_wikis = Wiki.where(public: false)


# Create pages
350.times do
  wikis.sample.pages.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraphs,
  )
end
pages = Page.all

puts "Created #{users.count} users"
puts "Created #{wikis.count} wikis"
puts "Created #{pages.count} pages"
