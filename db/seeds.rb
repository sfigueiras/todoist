require 'faker'

private
	
def add_tasks(list)
	[LongTask, SimpleTask, TemporaryTask].each do |klass|
		p "Creating 2 #{klass} tasks"
		(rand(2)+2).times do
			descriptions = [Faker::StarWars.quote, Faker::Hacker.say_something_smart, Faker::ChuckNorris.fact, Faker::Hipster.sentence]

			attrs = { description: descriptions[rand(descriptions.size)], state: false, priority: (rand(3)+1), progress: 0 }

			list.tasks.push(klass.create attrs)
			list.save

			p "    Added task #{attrs[:description]} to list"
		end
	end
end

required_list = List.create(name: "Lista 0")
add_tasks(required_list)

5.times do

	list = List.create(name: Faker::Beer.name)
	p "Created list with name #{list.name}..."

	add_tasks(list)
end