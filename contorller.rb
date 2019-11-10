module Controller
    load 'model.rb'
    load 'view.rb'

    class Controller
        def initialize
            @valerik = Model::Valera.new
            @view = View::View.new
        end

        def game_start
            exit_game = false
            @view.welcome
            while @valerik.alive do
                @view.stats(@valerik)
                user_action = @view.get_user_action
                exit_game = do_action(user_action)
                break if exit_game
            end
            puts "R.I.P VALERIK"
        end
        
        def do_action(user_action)
            case user_action
                when "1"
                Model::GoWork.new.change(@valerik)
                exit_game = false
                when "2"
                Model::WatchNature.new.change(@valerik)
                exit_game = false
                when "3"
                Model::DrinkWine.new.change(@valerik)
                exit_game = false
                when "4"
                Model::GoToBar.new.change(@valerik)
                exit_game = false
                when "5"
                Model::DrinkWithMarginals.new.change(@valerik)
                exit_game = false
                when "6"
                Model::SingInMetro.new.change(@valerik)
                exit_game = false
                when "7"
                Model::Sleep.new.change(@valerik)
                exit_game = false
                when "8"
                exit_game = true
                else
                @view.print("Неизвестный пункт меню")
                exit_game = true
            end
        end
    end
end


Controller = Controller::Controller.new

Controller.game_start