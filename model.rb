class Valera
    attr_accessor :health, :mana, :fun, :tired, :money

    def init
        @health = 100
        @mana = 0
        @fun = 0
        @tired = 0
        @money = 0
    end
end

class GoWork
    def check(human)
        (human.mana < 50) && (human.tired < 10)
    end
    def change(human)
        if self.check(human)
            human.mana -= 30
            human.fun -= 5
            human.tired += 70
            human.money += 100
            puts "active"
        else
            puts "not active"
        end
    end
end

class WatchNature
    def change(human)
        human.mana -= 10
        human.fun += 1
        human.tired += 10
        puts "active"
    end
end

class DrinkWine
    def change(human)
        human.health -= 5
        human.mana += 30
        human.fun -= 1
        human.tired += 10
        human.money -= 20
        puts "active"
    end
end

class GoToBar
    def change(human)
        human.health -= 10
        human.mana += 60
        human.fun += 1
        human.tired += 40
        human.money -= 100
        puts "active"
    end
end

class GoToBar
    def change(human)
        human.health -= 10
        human.mana += 60
        human.fun += 1
        human.tired += 40
        human.money -= 100
        puts "active"
    end
end

class DrinkWithMarginals
    def change(human)
        human.health -= 80
        human.mana += 90
        human.fun += 5
        human.tired += 80
        human.money -= 150
        puts "active"
    end
end

class SingInMetro
    def change(human)
        if ((human.mana > 40) && (human.mana < 70))
            human.money += 50
        end 
        human.mana += 10
        human.fun += 1
        human.tired += 20
        human.money += 10
        puts "active"
    end
end

class Sleep
    def change(human)
        if human.mana < 30
            human.health += 90
        end
        human.mana -= 50
        if human.mana > 70
            human.fun -= 3
        end
        human.tired -= 70
        puts "active"
    end
end

# valer = Valera.new
# valer.init()

# action = GoWork.new

# action.change(valer)