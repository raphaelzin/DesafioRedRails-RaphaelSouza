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

users = User.order(:created_at).take(12)
3.times do |m|
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


users = User.order(:created_at).take(8)
rooms = Room.order(:created_at).take(20)
rooms.each do |room|
	users.each {|user| room.comments.create!(
							# Qualquer frase bizarra que aparecer é culpa do Faker
							text: Faker::Friends.quote,
							user_id: user.id
						)}
end


users = User.order(created_at: :desc ).take(4)
rooms.each do |room|
	users.each {|user| room.requests.create!(
							out: Faker::Date.forward(10),
							in: Faker::Date.backward(10),
							user_id: user.id,
							accepted: false
						)}
end

rooms.each do |room|
	users.each {|user| user.rent_histories.create!(
							out: Faker::Date.forward(10),
							in: Faker::Date.backward(10),
							room_id: room.id,
						)}
end

