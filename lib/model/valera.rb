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

end