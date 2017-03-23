
# User.destroy_all
# Room.destroy.all

#users
User.create!(name:  "Raphael Souza",
             email: "raphael.pinheiro.souza@gmail.com",
             password:"passwd")


20.times do |n|
  name  = Faker::Name.name
  email = "mock-#{n+1}@gmail.com"
  password = "password"
  User.create!(name: name,email: email,
				password:              password)
end

users = User.order(:created_at).take(8)
10.times do |m|
	users.each {|user| user.rooms.create!(
						title: Faker::Book.title,
						address: Faker::Address.street_address,
						desc: Faker::StarWars.quote,
						guests: Faker::Number.between(1, 5),
						beds: Faker::Number.between(1, 3),
						price: Faker::Number.decimal(2),
						available: true
				)}
end