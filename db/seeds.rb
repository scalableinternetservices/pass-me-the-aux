# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

x = 0
while x < 10000
    User.create(name: "seed", email: "me@email.com", role: 0, id: rand(1000000), image_url: "https://www.askideas.com/media/12/Cute-Baby-Funny-Pig-Picture.jpg")
    x = x + 1
end