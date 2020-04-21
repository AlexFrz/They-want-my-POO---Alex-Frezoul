require 'bundler'
Bundler.require

require_relative 'lib/player'

puts "
----------------------------------------------------
|  Bienvenue sur 'ILS VEULENT TOUS MA POO' !       |
| Le but du jeu est d'être le dernier survivant !  |
----------------------------------------------------

"
#Initialisation du player
print "Quel blase veux-tu donner à ton perso?  > " 
name = gets.chomp
humanplayer1 = HumanPlayer.new(name)


#Initialisation des ennemis
    enemy_1 = Player.new("Josiane")
    enemy_2 = Player.new("José")

    enemies = []
    enemies << enemy_1
    enemies << enemy_2

# La marrave
while humanplayer1.life_points > 0 && (enemy_1.life_points > 0 || enemy_2.life_points > 0)
# Le menu
gets.chomp
puts "Quelle action veux-tu effectuer ?

a - chercher une meilleure arme
s - chercher à se soigner 

attaquer un joueur en vue :"
print "0 - " 
print enemy_1.show_state
print "1 - " 
print enemy_2.show_state

print "> " 
response = gets.chomp

if response == "a"
    humanplayer1.search_weapon
elsif response == "s" 
    humanplayer1.search_health_pack
elsif response == "0"
    puts "Tu attaques #{enemy_1.name}"
    humanplayer1.attacks(enemy_1)
elsif response == "1"
    puts "Tu attaques #{enemy_2.name}"
    humanplayer1.attacks(enemy_2)
else
    puts "Vous passez votre tour, dommage... :("
end

#Riposte des ptits filsdeups
gets.chomp
puts "Les autres joueurs t'attaquent !"
@enemies.each do |enemy|
    if enemy.life_points > 0
    puts "-------------------------------------"
    enemy.attacks(humanplayer1)
    puts "-------------------------------------"
    puts " "
    end
end
end
    


# Sois toi, sois eux.
if humanplayer1.life_points > 0
    puts "BRAVO! TU AS GAGNÉ!"
else
    puts "Loser, tu as perdu. J'suis déçu wallaye."
end




binding.pry