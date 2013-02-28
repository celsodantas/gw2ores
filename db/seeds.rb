# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ResetDate.new.save


# 0 - US Server
# 1 - EU Server
servers = 
[{location: "US", name: "Anvil Rock"},
{location: "US", name: "Blackgate"},
{location: "US", name: "Borlis Pass"},
{location: "US", name: "Crystal Desert"},
{location: "US", name: "Darkhaven"},
{location: "US", name: "Devona's Rest"},
{location: "US", name: "Dragonbrand"},
{location: "US", name: "Ehmry Bay"},
{location: "US", name: "Eredon Terrace"},
{location: "US", name: "Ferguson's Crossing"},
{location: "US", name: "Fort Aspenwood"},
{location: "US", name: "Gate of Madness"},
{location: "US", name: "Henge of Denravi"},
{location: "US", name: "Isle of Janthir"},
{location: "US", name: "Jade Quarry"},
{location: "US", name: "Kaineng"},
{location: "US", name: "Maguuma"},
{location: "US", name: "Northern Shiverpeaks"},
{location: "US", name: "Sanctum of Rall"},
{location: "US", name: "Sea of Sorrows"},
{location: "US", name: "Sorrow's Furnace"},
{location: "US", name: "Stormbluff Isle"},
{location: "US", name: "Tarnished Coast"},
{location: "US", name: "Yak's Bend"},

{location: "EU", name: "Aurora Glade"},
{location: "EU", name: "Blacktide"},
{location: "EU", name: "Desolation"},
{location: "EU", name: "Far Shiverpeaks"},
{location: "EU", name: "Fissure of Woe"},
{location: "EU", name: "Gandara"},
{location: "EU", name: "Gunnar's Hold"},
{location: "EU", name: "Piken Square"},
{location: "EU", name: "Ring of Fire"},
{location: "EU", name: "Ruins of Surmia"},
{location: "EU", name: "Seafarer's Rest"},
{location: "EU", name: "Underworld"},
{location: "EU", name: "Vabbi"},
{location: "EU", name: "Whiteside Ridge"},

{location: "French", name: "Pierre Arborea (Arborstone)"},
{location: "French", name: "Roche de l'Augure (Augury Rock)"},
{location: "French", name: "Fort Ranik"},
{location: "French", name: "Mer de Jade (Jade Sea)"},
{location: "French", name: "Place de Vizunah (Vizunah Square)"},

{location: "German", name: "Abaddons Mund"},
{location: "German", name: "Drakkar-See"},
{location: "German", name: "Dzagonur"},
{location: "German", name: "Elonafels"},
{location: "German", name: "Kodasch"},
{location: "German", name: "Millersund"},
{location: "German", name: "Flussufer"},

{location: "Spanish", name: "Bahía de Baruch (Baruch Bay)"}]

maps = [{name: "Malchors Leap", image: "malchors_leap.jpeg", image_mini: "malchors_leap-mini.jpeg", size_x: 1000, size_y: 549},
		{name: "Cursed Shore", image: "cursed_shore.jpeg", image_mini: "cursed_shore-mini.jpg", size_x: 600, size_y: 1144},
		{name: "Frostgorge Sound", image: "frostgorge_sound.jpeg", image_mini: "frostgorge_sound-mini.jpeg", size_x: 1000, size_y: 986},
		{name: "Southsun Cove", image: "southsun_cove.jpeg", image_mini: "southsun_cove-mini.jpeg", size_x: 1000, size_y: 658}]



servers.each do |server|
	unless Server.find_by_name(server[:name]).present?
		Server.create! server
	end
end

maps.each do |map|
	unless Map.find_by_name(map[:name]).present?
		Map.create! map
	end
end

# Creating relations between map and server
Server.all.each do |server|
	Map.all.each do |map|
		next if server.maps.include? map

		server.maps << map
	end
end



# maps.each do |map|
# 	if Map.find_by_name(map[:name]).nil?
# 		Map.new(name: map[:name], image: map[:image], image_mini: map[:image_mini], size_x: map[:size_x], size_y: map[:size_y]).save
# 	end
# end

