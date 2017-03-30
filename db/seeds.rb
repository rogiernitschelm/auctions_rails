User.destroy_all
Seller.destroy_all
Buyer.destroy_all

user1 = User.create!(
  email: 'roggers@mail.com',
  password: 'abcd1234',
  admin: true,
  first_name: 'Sjaak',
  last_name: 'van Veen',
  location: 'Amsterdams'
)

user2 = User.create!(
  email: 'kees@mail.com',
  password: 'abcd1234',
  admin: true,
  first_name: 'Hermientje',
  last_name: 'De Boer',
  location: 'Culemborg'
)

Seller.create!(user: user1)
Buyer.create!(user: user2)

puts "#{Seller.count} sellers and #{Buyer.count} sellers generated."
