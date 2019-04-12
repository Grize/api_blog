# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

POST_COUNT = 200_000
USER_COUNT = 200
IPS = 50

usernames = []
USER_COUNT.times { usernames << Faker::Internet.unique.user_name }

ips = []
IPS.times { ips << Faker::Internet.unique.ip_v4_address }

POST_COUNT.times do
  username = usernames.sample
  ip = ips.sample
  body = Faker::Lorem.paragraphs(5).join('\n')
  title = Faker::Lorem.sentence

  post = PostCreateService.create(
    username: username,
    ip: ip,
    body: body,
    title: title
  )

  if rand(50) == 0
    rate_post = Post.find(post.post_id)
    rand(1..50).times do
      rate = rand(1..5)
      UpdateRateService.update({ rate: rate }, rate_post)
    end
  end
end
