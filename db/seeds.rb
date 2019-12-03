# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

x = 0
while x < 10000
    rand_ID = rand(1000000).to_s
    User.create(name: "seed", email: "me@email.com", role: 0, id: rand_ID, image_url: "https://www.askideas.com/media/12/Cute-Baby-Funny-Pig-Picture.jpg")
    Recommendation.create(requestor_name: "seed", requestor_id: rand_ID, url_to_song: "https://open.spotify.com/track/5jsw9uXEGuKyJzs0boZ1bT", recommender_name: "seed", recommender_id: rand_ID, verdict: 1)
    Score.create(user_id: rand_ID, score: 0, user_name: "seed")
    x = x + 1
end