desc "Fill the database tables with some sample data"
task sample_data: :environment do
  starting = Time.now

  if Rails.env.development?
  User.delete_all
  end

  User.create(email: "bob@example.com", password: "password", username: "bob")
  User.create(email: "alice@example.com", password: "password", username: "alice")


  10.times do
    name = Faker::Name.first_name
    User.create(
      email: "#{name}@example.com",
      password: "password",
      username: name.downcase,
    )
  end


  users = User.all

  # users.each do |user|
  #   rand(3).times do
  #   user.causes.create(
  #     description: Faker::Quote.jack_handey,
  #     theme: Faker::Quote.jack_handey,
  #   )

end

