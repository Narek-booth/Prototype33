desc "Fill the database tables with some sample data"
task sample_data: :environment do
  starting = Time.now

  if Rails.env.development?
    Post.delete_all
    Favorite.delete_all
    Commitment.delete_all
    Cause.delete_all
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
  causes = Cause.all

  users.each do |user|
    rand(5).times do
    user.causes.create(
      description: Faker::Quote.jack_handey,
      theme: Faker::Verb.base,
      status: Cause.statuses.values.sample,
      funds_needed: rand(0..1000),
      image: "https://robohash.org/#{rand(9999)}",
    )
    end
  end

  u = User.all.sample
  c = Cause.all.sample

  # com = Commitment.new(
  #       description: "abc",
  #       target: "abc",
  #       status: "stopped",
  #       donation_size: rand(5),
  #       cause_id: c.id,
  #       owner_id: u.id
  #     )
  # com.save
  
  # p com

  # begin
  #   com.save
  # rescue Rollback
  #   p "errrror"
  # end

  users.each do |user|
    causes.each do |cause|
      if rand < 0.70
        user.commitments.create(
        description: Faker::Quote.jack_handey,
        target: Faker::Verb.base,
        status: Commitment.statuses.values.sample,
        donation_size: rand(5),
        cause_id: cause.id,
      )
      end
    end
  end


  users.each do |user|
    causes.each do |cause|
      if rand < 0.20
        user.favorites.create(
        cause_id: cause.id,
        )
      end
      
      if rand < 0.50
        user.posts.create(
        cause_id: cause.id,
        body: Faker::Quote.jack_handey,
        )
      end

    end
  end


    ending = Time.now
  p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  p "There are now #{Cause.count} causes."
  p "There are now #{Commitment.count} commitments."
  p "There are now #{Favorite.count} favorites."
  p "There are now #{Post.count} posts."

end

