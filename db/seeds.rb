# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Session.destroy_all     # belongs_to game/gamemaster/player
Game.destroy_all        # has_many sessions
Gamemaster.destroy_all  # has_many sessions & has_many games, through sessions
Player.destroy_all      # has_many sessions & has_many games, through sessions

coc = Game.create(name: "Call of Cthulhu", system: "Basic Roleplaying", difficulty: "5", mature_content: true)
dg = Game.create(name: "Delta Green", system: "Basic Roleplaying", difficulty: "6", mature_content: true)
wfrp = Game.create(name: "Warhammer Fantasy Roleplay", system: "Percentile", difficulty: "8", mature_content: true)
sf = Game.create(name: "Starfinder", system: "d20 System", difficulty: "5", mature_content: false)
alien = Game.create(name: "Alien", system: "Year Zero Engine", difficulty: "4", mature_content: true)

brian = Gamemaster.create(name: "BriMac", experience: "2", availability: "Weekends")

ariel = Player.create(name: "AriCha", experience: "0", availability: "Weekends")

wfrp.sessions.create(time: "11:23", length: "2", description: "New Campaign of CoC, All welcome!")

puts "Games: #{Game.count}"
puts "Sessions: #{Session.count}"
puts "GameMasters: #{Gamemaster.count}"
puts "Players: #{Player.count}"