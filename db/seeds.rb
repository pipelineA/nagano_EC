# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  # movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  # Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@admin',
   password: '111111',
)

Genre.create!([
  { name: 'ケーキ' },
  { name: 'クッキー' },
  { name: 'プリン' }
])

Item.create!([
  { genre_id: 1,
    name: 'ショートケーキ',
    description: 'ショートケーキです',
    image_id: 'sweets_cake_far_breton.png',
    price: '400'},
  { genre_id: 1,
    name: 'チョコケーキ',
    description: 'チョコケーキです',
    image_id: 'sweets_cake_far_breton.png',
    price: '500'},
  { genre_id: 2,
    name: 'クッキー',
    description: 'クッキーです',
    image_id: 'thumbnail_sweets_chiffoncake.jpg',
    price: '400'}

])

50.times do |n|
  user = User.create!(
    family_name: '顧客',
    first_name: n,
    kana_family_name: 'ユーザー',
    kana_first_name: n,
    phone_number: "090-#{n}-000",
    password: 'password',
    password_confirmation: 'password',
    email: "user#{n}@com",
    is_unsubscribe: false
  )
    user.addresses.create!(
      postal_code: "000-#{n}#{n}",
      address: 'somewhere'
    )
end