class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end

    def compute_damage
        return rand(1..6)
    end
   
    def attacks(player)
        damage_recieved = compute_damage
        "le joueur #{self} attaque le joueur #{player}"
        player.gets_damage(damage_recieved)
    end
   
    def gets_damage(damage_recieved)
         @life_points = @life_points - damage_recieved
        puts "il lui inflige #{damage_recieved} points de dommages"
        if @life_points <= 0
        puts "le joueur #{name} a été tué!"
        end
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        super(name)
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
        if new_weapon_level > weapon_level
            puts "Youhou! Elle est meilleure que ton arme actuelle: tu la prends."
            @weapon_level = new_weapon_level
        else 
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        a = rand(1..6)
        if a == 1
            puts "tu n'as rien trouvé"
        elsif 2 < a && a < 5
            @life_points = @life_points + 50
            if @life_points > 100
            @life_points = 100
            end
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        else a == 6
            @life_points = @life_points + 80
            if @life_points < 100 
            @life_points = 100
            end
            puts "Woaw, tu as trouvé un pack de +80 points de vie !"
        end
    end

    end

