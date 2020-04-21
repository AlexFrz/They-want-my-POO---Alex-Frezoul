require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "
----------------------------------------------------
|  Bienvenue sur 'ILS VEULENT TOUS MA POO' !       |
| Le but du jeu est d'être le dernier survivant !  |
----------------------------------------------------

"

puts "Comment tu t'appelles?"
user = gets.chomp 

my_game = Game.new(user)

while my_game.is_still_ongoing? do
    my_game.menu
    choice = gets.chomp
    my_game.menu_choice(choice)
    my_game.enemies_attack
    my_game.show_players
end

my_game.ending
