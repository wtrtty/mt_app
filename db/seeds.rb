#日本名
Faker::Config.locale = :ja

# メインのサンプルユーザーを1人作成する
User.create!(name:  "ExampleUser",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             gender:                '女性',
             birthday:              Date.parse('1990-01-01'),
             profile:               'よろしく',
             live:                  '東京',
             admin: true)

# 男性のユーザーをまとめて生成する
50.times do |n|
  name = "male#{n+1}"
  email = "male-#{n+1}@samplemtapp.org"
  password = "password"
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
  password = "password"
  User.create!(name:                  name,
               email:                 email,
               password:              password,
               password_confirmation: password,
               gender:                '女性',
               birthday: Faker::Date.birthday(min_age: 18, max_age: 50),
               profile:  Faker::Lorem.sentence,
               live:     Faker::Address.state)
end


# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
