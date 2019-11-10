module Controller
    load 'model.rb'
    load 'view.rb'

    class Controller
        def initialize(health, mana, fun, tired, money, alive)
            @valerik = Model::Valera.new(health, mana, fun, tired, money, alive)
            @view = View::View.new
        end

        def save_state(state, path)
            f = File.open path, 'w'
            state.instance_variables.each do |s|
              f.puts s.to_s[1..-1] + ' ' + state.instance_variable_get(s).to_s
            end
            f.close unless f.nil?
        end

        def save_action(state)
            path = @view.save_action
            if path == ''
                @view.save_action_error
                return
            end
            self.save_state(state, path)
        end

        def load_state(state, path)
            f = File.open path, 'r'
            f.each_line do
                param, val = f.gets.chomp.split ' '
                state.instance_variable_set(('@' + param), val)
            end
            f.close unless f.nil?
        end

        def load_action(state)
            path = @view.load_action
            if path == ''
                @view.load_action_error
                return
            end
            self.load_state(state, path)
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
                when "q"
                    exit_game = true
                when "s"
                    self.save_action(@valerik)
                    exit_game = false
                when "l"
                    self.load_action(@valerik)
                    exit_game = false
                else
                @view.print("Неизвестный пункт меню")
                exit_game = true
            end
        end
    end
end


# Controller = Controller::Controller.new

# Controller.game_start