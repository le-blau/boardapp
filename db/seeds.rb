# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# def numbering_user
#   return User.maximum(:id) + 1
# end


# test ユーザー 1人
User.create(
  id: "0",
  name: "test",
  email: "test@example.com",
  password: "test"
)
fruits = ["apple", "orange", "melon", "banana", "pineapple", "strawberry", "acerola", "cherry", "kiwi", "lemon"]
10.times do |i|
  Post.create(
    content: fruits.sample(rand(10)).join(' '),
    user_id: "0"
  )
end

# seed ユーザー10人
10.times do |i|
  User.create(
    name: "seed_user#{i + 1}",
    email: "seed#{i + 1}@example.com",
    password: "seed#{i + 1}"
  )
  Post.create(
    content: "seeeeeeeeeeeeeeeeeeeeeeeeeed_content#{i + 1}",
    user_id: "#{User.maximum(:id)}" # Post.user_idには、直前のUser.create()で作ったUser.idを設定する
  )
end
