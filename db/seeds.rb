# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ResetDate.new.save

maps = [{name: "Malchors Leap", image: "malchors_leap.jpeg", image_mini: "malchors_leap-mini.jpeg", size_x: 1000, size_y: 549},
		{name: "Cursed Shore", image: "cursed_shore.jpeg", image_mini: "cursed_shore-mini.jpg", size_x: 600, size_y: 1144},
		{name: "Frostgorge Sound", image: "frostgorge_sound.jpeg", image_mini: "frostgorge_sound-mini.jpeg", size_x: 1000, size_y: 986}]


maps.each do |map|
	Map.new(name: map[:name], image: map[:image], image_mini: map[:image_mini], size_x: map[:size_x], size_y: map[:size_y]).save
end