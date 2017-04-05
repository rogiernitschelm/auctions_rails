User.destroy_all
Employer.destroy_all
JobSeeker.destroy_all

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

Employer.create!(user: user1)
JobSeeker.create!(user: user2)

puts "#{Employer.count} employers and #{JobSeeker.count} employers generated."
