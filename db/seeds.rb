5.times do
  title = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph
  Post.create(title: title, description: description)
end