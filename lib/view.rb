require 'colorize'

module View
    load 'model.rb'
    class View
        attr_accessor :path_to_file

        def welcome
        puts "HELLLO EPTA".light_white.on_red
        end
    
        def get_user_action
            puts "Выберите действие:".light_white.on_green
            puts "1. Пойти на работу"
            puts "2. Созерцать природу"
            puts "3. Выпить винца"
            puts "4. Сходить а бар"
            puts "5. Выпить с маргинальными личностями"
            puts "6. Петь в метро"
            puts "7. Спать"
            puts "q - Выход из игры"
            puts "s - Сохранить игру"
            puts "l - Загрузить игру"
            gets.chomp
        end
    
        def stats(valera)
            system('clear')
            puts "ВАЛЕРИК:".black.on_white
            puts "Здоровье = #{valera.health}\n"
            puts "Алкоголь в крови = #{valera.mana}\n"
            puts "Жизнерадостность = #{valera.fun}\n"
            puts "Усталость = #{valera.tired}\n"
            puts "Деньги = #{valera.money}\n\n"
        end

        def save_action
            puts "Enter path to file: "
            gets.chomp
        end

        def save_action_error
            puts "Save error! Path is empty."
        end

        def load_action
            puts "Enter path to file: "
            gets.chomp
        end

        def load_action_error
            puts "Load error! Path is empty."
        end

        def print(msg)
            puts "#{msg}\n"
        end
    end
end