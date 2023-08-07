#Fake users to populate database
5.times do
  User.create(
    email: Faker::Internet.email,
    encrypted_password: Faker::Internet.password
  )
end