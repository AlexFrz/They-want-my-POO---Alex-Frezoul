class Game
    attr_accessor :human_player, :ennemies

    def initialize(name)
        enemy_1 = Player.new("Thanos")
        enemy_2 = Player.new("Joker")
        enemy_3 = Player.new("DarkVador")
        enemy_4 = Player.new("Voldemort")
        @human_player = name
        @enemies = [enemy_1,enemy_2,enemy_3,enemy_4]
    end

    def kill_player(enemy_killed)
        @enemies.delete(enemy_killed)
    end

    def is_still_ongoing?
       if human_player.life_points > 0 && @enemies.any?
       return true 
       else
       return false
        end
    end

    def show_players
        puts human_player.show_state
        puts @enemies.count
    end

    def menu
        puts "Quelle action veux-tu effectuer ?

a - chercher une meilleure arme
s - chercher à se soigner 

attaquer un joueur en vue :"
print "0 - " 
print enemy_1.show_state
print "1 - " 
print enemy_2.show_state
print "2 - " 
print enemy_3.show_state
print "3 - " 
print enemy_4.show_state
    end

    def menu_choice(string)
        if response == "a"
            human_player.search_weapon
        elsif response == "s" 
            human_player.search_health_pack
        elsif response == "0"
            puts "Tu attaques #{enemy_1.name}"
            human_player.attacks(enemy_1)
        elsif response == "1"
            puts "Tu attaques #{enemy_2.name}"
            human_player.attacks(enemy_2)
        elsif response == "2"
            puts "Tu attaques #{enemy_3.name}"
            human_player.attacks(enemy_3)
        elsif response == "3"
            puts "Tu attaques #{enemy_4.name}"
            human_player.attacks(enemy_4)
        else
            puts "Vous passez votre tour, dommage... :("
        end

        kill_player
    end

    def enemies_attack
        puts "Les autres joueurs t'attaquent !"
        @enemies.each do |enemy|
         if enemy.life_points > 0
         puts "-------------------------------------"
          enemy.attacks(human_player)
          puts "-------------------------------------"
          puts " "
        else
        ending
        end
        end
    end

    def ending
        if human_player.life_points > 0
            puts "BRAVO! TU AS GAGNÉ!"
        else
            puts "Loser, tu as perdu. J'suis déçu wallaye."
        end
    end
end
