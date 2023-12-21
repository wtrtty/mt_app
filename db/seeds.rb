#日本名
Faker::Config.locale = :ja

# メインのサンプルユーザーを1人作成する
User.create!(name:  "ExampleUser",
             email: "example@railstutorial.org",
             password:              "tawa",
             password_confirmation: "tawa",
             gender:                '女性',
             birthday:              Date.parse('1990-01-01'),
             profile:               'よろしく',
             live:                  '東京',
             admin: true)

# 男性のユーザーをまとめて生成する
50.times do |n|
  name = "male#{n+1}"
  email = "male-#{n+1}@samplemtapp.org"
  password = "tawa"
  User.create!(name:                  name,
               email:                 email,
               password:              password,
               password_confirmation: password,
               gender:                '男性',
               birthday: Faker::Date.birthday(min_age: 18, max_age: 50),
               profile:  Faker::Lorem.sentence,
               live:     Faker::Address.state)
end

# 女性のユーザーをまとめて生成する
50.times do |n|
  name = "female#{n+1}"
  email = "female-#{n+1}@samplemtapp.org"
  password = "tawa"
  User.create!(name:                  name,
               email:                 email,
               password:              password,
               password_confirmation: password,
               gender:                '女性',
               birthday: Faker::Date.birthday(min_age: 18, max_age: 50),
               profile:  Faker::Lorem.sentence,
               live:     Faker::Address.state)
end

# ユーザーフォローのリレーションシップを作成する
users = User.all
user  = users.first
active_likes= users[2..40]
passive_likes = users[13..50]
active_likes.each { |to_user| user.do_like(to_user) }
passive_likes.each { |from_user| from_user.do_like(user) }

#users = User.all
#user  = users.first
#following = users[2..50]
#followers = users[3..40]
#following.each { |followed| user.follow(followed) }
#followers.each { |follower| follower.follow(user) }

# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
