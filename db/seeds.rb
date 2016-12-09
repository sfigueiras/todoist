# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
	list = List.create(name: Faker::Beer.name)
	p "Created list with name #{list.name}..."

	[LongTask, SimpleTask, TemporaryTask].each do |klass|
		p "Creating 2 #{klass} tasks"
		2.times do
			descriptions = [Faker::StarWars.quote, Faker::Hacker.say_something_smart, Faker::ChuckNorris.fact, Faker::Hipster.sentence]

			attrs = { description: descriptions[rand(descriptions.size)], state: false, priority: (rand(3)+1) }

			list.tasks.push(klass.create attrs)
			list.save

			p "    Added task #{attrs[:description]} to list"
		end
	end
end