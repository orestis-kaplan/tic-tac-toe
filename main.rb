$LOAD_PATH << '.'
require('game')

def main
  loop do
    puts welcome_screen

    print "Please enter the dimension of the table [default: 3 (3 means 3x3)]: "
    dimension = gets.strip.to_i

    player_name1,player1_symbol = setup_player(1)

    player_name2,player2_symbol = setup_player(2)

    game = Game.new(dimension, player_name1, player1_symbol, player_name2, player2_symbol)

    on_game = true
    play_again = true

    print_table(game)

    while on_game

      game_status = game.status

      if game.still_active?(game_status)
        next_move = setup_move(game.player_on_turn, game.board)
        game.make_a_move(next_move)
        game.fill_table

        system("cls") || system("clear")
        game.switch_players

        print_table(game)
      else
        if game.resolve_game?(game_status)
          puts "#{game.player_on_turn.name} you won!!"
        else
          puts "Sorry none of you won"
        end
          on_game = false
      end
    end

    print 'Do you want to play again? (y/n) [default: n]: '
    play_again = gets.chomp.downcase.match(/y|yes/) ? true : false
    on_game = true if play_again
    system("cls") || system("clear") if play_again
    break unless play_again
  end
  puts "Thanks for play this game!"
end

def welcome_screen
  welcome = "WELCOME TO THE TIC TAC TOE GAME!"
  welcome = "#{'*' * welcome.length}\n#{welcome}\n#{'*' * welcome.length}"
end

def setup_player  num_of_player
  print "Please insert the name of the player #{num_of_player}: "
  player_name = gets.strip.capitalize
  print "Please insert the symbol of the player #{num_of_player}: "
  player_symbol = gets.strip.capitalize
  return player_name,player_symbol
end

def setup_move(player, board)
    puts "Enter the value from 1 to #{board.size**2}"
    print "#{player.name} your turn: "
    next_move = gets.match(/\d+/)[0].to_i
    raise "Please enter a number in the range." unless next_move.between?(1, board.size**2)
    raise "Please select an empty position." unless board.empty_position?(next_move)
  rescue NoMethodError
    puts "Please enter only numeric values"
    retry
  rescue RuntimeError => e
    puts "#{e}"
    retry
  else
    return next_move

end

def print_table(game)
  size = game.board.size
  puts "TABLE GUIDE"
  puts game.paint_table_guide
  puts "*" * ((size * size).to_s.length * size + size)
  puts "TABLE GAME"
  puts game.paint_table
end

main
