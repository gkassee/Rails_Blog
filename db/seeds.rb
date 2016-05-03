# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Post.delete_all
Comment.delete_all



users = []

30.times do

	users << User.create(password: '1', name: Faker::Internet.user_name, email: Faker::Internet.safe_email)

end


users.each do |user|

	posts = []

	4.times do
		posts << Post.create(user_id: user.id, title: Faker::Hipster.sentence, body: Faker::StarWars.quote)
	end

	2.times do
		Comment.create(user_id: user.id, post_id: posts.sample.id, body: Faker::StarWars.quote)
	end

end

