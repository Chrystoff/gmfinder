
# Session.destroy_all     # belongs_to game/gamemaster/player
Gamemaster.destroy_all  # has_many sessions, dependent: :destroy
Game.destroy_all        # has_many sessions
Player.destroy_all      # has_many sessions


# list of 5 seeded games
dnd = Game.create!(name: "Dungeons & Dragons", system: "d20 System", difficulty: "5", mature_content: false)
coc = Game.create!(name: "Call of Cthulhu", system: "Basic Roleplaying", difficulty: "4", mature_content: true)
dg = Game.create!(name: "Delta Green", system: "Basic Roleplaying", difficulty: "6", mature_content: true)
wfrp = Game.create!(name: "Warhammer Fantasy Roleplay", system: "Percentile", difficulty: "8", mature_content: true)
sf = Game.create!(name: "Starfinder", system: "d20 System", difficulty: "5", mature_content: false)
alien = Game.create!(name: "Alien", system: "Year Zero Engine", difficulty: "4", mature_content: true)

# A game master
brian = Gamemaster.create!(name: "BriMac", experience: "2", availability: "Weekends")
jacob = Gamemaster.create!(name: "JacMac", experience: "1", availability: "Weekdays")

# A player
ariel = Player.create!(name: "AriCha", experience: "0", availability: "Weekends")
dan = Player.create!(name: "DanMac", experience: "1", availability: "Weekdays")

# adding default accounts for different levels of access
adminacc = User.create(email: 'admin@test.com', password: 'admin123')
adminacc.add_role :admin

gmacc = User.create(email: 'gm@test.com', password: 'game123')
gmacc.add_role :game_master

playeracc = User.create(email: 'player@test.com', password: 'player123')
playeracc.add_role :player


puts "Games: #{Game.count}"
puts "GameMasters: #{Gamemaster.count}"
puts "Players: #{Player.count}"
puts "Users: #{User.count}"
puts "Roles: #{Role.count}"