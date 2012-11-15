# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ResetDate.new.save

maps = [{name: "Malchors Leap", image: "malchors_leap.jpeg", image_mini: "malchors_leap-mini.jpeg"},
		{name: "Cursed Shore", image: "cursed_shore.jpeg", image_mini: "cursed_shore-mini.jpg"}]


maps.each do |map|
	Map.new(name: map[:name], image: map[:image], image_mini: map[:image_mini]).save
end