require 'colorize'

module View
    load 'model.rb'
    load 'adapter.rb'
    class View
        attr_accessor :path_to_file

        def welcome
            IOAdapter.write("hello\n")
        end
    
        def get_user_action
            IOAdapter.write(
            "Выберите действие:
            1. Пойти на работу
            2. Созерцать природу
            3. Выпить винца
            4. Сходить а бар
            5. Выпить с маргинальными личностями
            6. Петь в метро
            7. Спать
            q - Выход из игры
            s - Сохранить игру
            l - Загрузить игру\n")
            IOAdapter.read
        end
    
        def stats(valera)
            system('cls')
            IOAdapter.write( "ВАЛЕРИК:")
            IOAdapter.write( "Здоровье = #{valera.health}\n")
            IOAdapter.write( "Алкоголь в крови = #{valera.mana}\n")
            IOAdapter.write( "Жизнерадостность = #{valera.fun}\n")
            IOAdapter.write( "Усталость = #{valera.tired}\n")
            IOAdapter.write( "Деньги = #{valera.money}\n\n")
        end

        def save_action
            IOAdapter.write( "Enter path to file: " )
            IOAdapter.read
        end

        def save_action_error
            IOAdapter.write( "Save error! Path is empty." )
        end

        def load_action
            IOAdapter.write( "Enter path to file: " )
            IOAdapter.read
        end

        def load_action_error
            IOAdapter.write( "Load error! Path is empty." )
        end

        def print(msg)
            IOAdapter.write("#{msg}\n")
        end
    end
end