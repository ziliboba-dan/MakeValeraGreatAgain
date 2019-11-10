module Model
    class Valera
        attr_accessor :health, :mana, :fun, :tired, :money, :alive
        
        def initialize(health, mana, fun, tired, money, alive)
            @health = health
            @mana = mana
            @fun = fun
            @tired = tired
            @money = money
            @alive = alive
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
            end
        end
    end

    class WatchNature
        def change(human)
            human.mana -= 10
            human.fun += 1
            human.tired += 10
        end
    end

    class DrinkWine
        def change(human)
            human.health -= 5
            human.mana += 30
            human.fun -= 1
            human.tired += 10
            human.money -= 20
            if human.health <= 0
                human.alive = false
            end
        end
    end

    class GoToBar
        def change(human)
            human.health -= 10
            human.mana += 60
            human.fun += 1
            human.tired += 40
            human.money -= 100
            if human.health <= 0
                human.alive = false
            end
        end
    end

    class DrinkWithMarginals
        def change(human)
            human.health -= 80
            human.mana += 90
            human.fun += 5
            human.tired += 80
            human.money -= 150
            if human.health <= 0
                human.alive = false
            end
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
        end
    end

    class Sleep
        def change(human)
            if human.mana < 30
                human.health += 90
            end
            if human.mana > 70
                human.fun -= 3
            end
            human.mana -= 50
            human.tired -= 70
        end
    end
end

# valer = Model::Valera.new(100, 0, 0, 0, 0, true)
