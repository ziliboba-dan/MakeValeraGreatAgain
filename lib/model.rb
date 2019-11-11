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
        attr_reader :human

        def initialize(human)
            @human = human
        end
        def check
            (human.money < 0) && (human.mana > 0)
        end
        def change
            if self.check
                self.human.mana -= 20
                self.human.fun -= 5
                self.human.tired += 50
                self.human.money += 100
            end
        end
    end

    class WatchNature
        attr_reader :human

        def initialize(human)
            @human = human
        end
        def change
            self.human.mana -= 10
            self.human.fun += 1
            self.human.tired += 10
        end
    end

    class DrinkWine
        attr_reader :human

        def initialize(human)
            @human = human
        end
        def change
            self.human.health -= 5
            self.human.mana += 30
            self.human.fun -= 1
            self.human.tired += 10
            self.human.money -= 20
            if self.human.health <= 0
                self.human.alive = false
            end
        end
    end

    class GoToBar
        attr_reader :human
        
        def initialize(human)
            @human = human
        end
        
        def change
            self.human.health -= 10
            self.human.mana += 60
            self.human.fun += 1
            self.human.tired += 40
            self.human.money -= 100
            if self.human.health <= 0
                self.human.alive = false
            end
        end
    end

    class DrinkWithMarginals
        attr_reader :human
        
        def initialize(human)
            @human = human
        end
        def change
            self.human.health -= 80
            self.human.mana += 90
            self.human.fun += 5
            self.human.tired += 80
            self.human.money -= 150
            if self.human.health <= 0
                self.human.alive = false
            end
        end
    end

    class SingInMetro
        attr_reader :human
        
        def initialize(human)
            @human = human
        end
        
        def change
            if ((self.human.mana > 40) && (self.human.mana < 70))
                self.human.money += 50
            end 
            self.human.mana += 10
            self.human.fun += 1
            self.human.tired += 20
            self.human.money += 10
        end
    end

    class Sleep
        attr_reader :human

        def initialize(human)
            @human = human
        end
        def change
            if self.human.mana < 30
                self.human.health += 90
            end
            if self.human.mana > 70
                self.human.fun -= 3
            end
            self.human.mana -= 50
            self.human.tired -= 70
        end
    end
end
