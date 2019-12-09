# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  # movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  # Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@admin',
   password: 'password',
)

Genre.create!([
  { name: 'ケーキ' },
  { name: 'クッキー' },
  { name: 'プリン' }
])

Item.create!([
  { genre_id: 1,
    name: 'チーズケーキ',
    description: 'チーズケーキです',
    image_id: '0a433310265ef52281c50d0c08d61a440fdd1a4ceeec769538a9eb121402',
    price: 400},
  { genre_id: 1,
    name: 'チョコケーキ',
    description: 'チョコケーキです',
    image_id: 'f08462eb79056da362b65d2732240c6045d55c8f45ba0b681d2ddafacf24',
    price: 500},
  { genre_id: 2,
    name: 'クッキー',
    description: 'クッキーです',
    image_id: 'b2357dc5c651aaa5c2059eae579c7b174ae486f9e332df547e6a315203e2',
    price: 400},
  { genre_id: 3,
    name: 'いちごプリン',
    description: 'いちごプリンです',
    image_id: '2c439c31159354b06a2e0b561580a9d7522362ef032bca0a9d4398e72b49',
    price: 300},

])

50.times do |n|
  user = User.create!(
    family_name: '顧客',
    first_name: n,
    kana_family_name: 'ユーザー',
    kana_first_name: n,
    phone_number: "090-#{n}#{n}-0000",
    password: 'password',
    password_confirmation: 'password',
    email: "user#{n}@com"
  )
  user.addresses.create!(
    postal_code: "000-#{n}#{n}",
    address: "渋谷区神南#{n}#{n}",
    receiver_name: "#{user.family_name} #{user.first_name}"
  )

  order = user.orders.create!(
    payment_method: (n % 2),
    ordered_receiver_name: "#{user.family_name} #{user.first_name}",
    ordered_postal_code: "000-#{n}#{n}",
    ordered_address: "渋谷区神南#{n}#{n}",
    billing_amount: ((n % 4 + 1) * 400 + (n % 4 + 1) * 300)
  )
  order.order_items.create!([
    {
      item_id: 1,
      item_count: (n % 4 + 1),
      ordered_price: 400,
      ordered_item_name: 'チーズケーキ'
    },
    {
      item_id: 4,
      item_count: (n % 4 + 1),
      ordered_price: 300,
      ordered_item_name: 'いちごプリン'
    }
  ])

end