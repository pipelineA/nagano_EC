
# find_or_create_byメソッド　例(email: 'admin@admin')をキーとして、同じemailを持つadminがデータベースに存在するか調べて、
# いない場合は作成する。うしろのdo〜endで、キー以外に持たせたいカラムを指定する。
# !をつけると、rails db:seedを実行した時に、not nullなどで正常に作成出来なかった場合にエラーが出て、知ることができる。

Admin.find_or_create_by!(email: 'admin@admin') do |admin|
  admin.password = 'password'
end
 
genre1 = Genre.find_or_create_by!(name: 'ケーキ')
genre2 = Genre.find_or_create_by!(name: 'クッキー')
genre3 = Genre.find_or_create_by!(name: 'プリン')

genre1.items.find_or_create_by!(name: 'チーズケーキ') do |item|
  item.description = 'チーズケーキです'
  item.image_id = '0a433310265ef52281c50d0c08d61a440fdd1a4ceeec769538a9eb121402'
  item.price = 400
end
genre1.items.find_or_create_by!(name: 'チョコケーキ') do |item|
  item.description = 'チョコケーキです'
  item.image_id = 'f08462eb79056da362b65d2732240c6045d55c8f45ba0b681d2ddafacf24'
  item.price = 500
end
genre2.items.find_or_create_by!(name: 'クッキー') do |item|
  item.description = 'クッキーです'
  item.image_id = 'b2357dc5c651aaa5c2059eae579c7b174ae486f9e332df547e6a315203e2'
  item.price = 400
end
genre3.items.find_or_create_by!(name: 'いちごプリン') do |item|
  item.description = 'いちごプリンです'
  item.image_id = '2c439c31159354b06a2e0b561580a9d7522362ef032bca0a9d4398e72b49'
  item.price = 300
end

# ユーザーを50人作成し、それぞれが1つの注文を持つ
# rails db:seed　を実行する度に1人につき1つの注文が作成される
50.times { |m|
  n = m + 1
  user = User.find_or_create_by!(email: "user#{n}@com") do |u|
    u.family_name = '顧客'
    u.first_name = n
    u.kana_family_name = 'ユーザー'
    u.kana_first_name = n
    u.phone_number = "090#{n}#{n}0000"
    u.password = 'password'
    u.password_confirmation = 'password'
  end
  user.addresses.find_or_create_by!(postal_code: "000#{n}#{n}") do |a|
    a.address = "渋谷区神南#{n}#{n}"
    a.receiver_name = "#{user.family_name} #{user.first_name}"
  end

  order = user.orders.create!(
    payment_method: n % 2,
    ordered_postal_code: "000#{n}#{n}",
    ordered_address: "渋谷区神南#{n}#{n}",
    billing_amount: (n % 4 + 1) * 400 + (n % 4 + 1) * 300,
    ordered_receiver_name: "#{user.family_name} #{user.first_name}"
  )

  order.order_items.create!(
    ordered_item_name: 'チーズケーキ',
    ordered_price: 400,
    item_id: 1,
    item_count: n % 4 + 1
  )
  order.order_items.create!(
    ordered_item_name: 'いちごプリン',
    ordered_price: 300,
    item_id: 4,
    item_count: n % 4 + 1
  )
}

CartItem.create!([
  { user_id: 1,
    item_id: 1,
    item_count: 3},
  { user_id: 1,
    item_id: 2,
    item_count: 5}
])
