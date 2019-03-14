$LOAD_PATH << '.'
require('game')

def main
  loop do
    puts welcome_screen

    print "Please enter the dimension of the table [default: 3 (3 means 3x3)]: "

    dimension = gets.strip.to_i

    player_name1,player1_symbol = get_player_info(1)

    player_name2,player2_symbol = get_player_info(2)

    game = Game.new(dimension, player_name1, player1_symbol, player_name2, player2_symbol)

    print_table(game)
    
    while game.still_active?(game.status)

        save_new_move(game)

        system("cls") || system("clear")

        print_table(game)

        game.switch_players

    end

    announce_winner(game)

    break unless play_again?

  end
  # goodbye
  puts "Thanks for playing this game!"
end

def save_new_move game
  next_move = setup_move(game.player_on_turn, game.board)
  game.make_a_move(next_move)
  game.fill_table
end

def announce_winner game
  if game.resolve_game?(game.status)
    puts "#{game.player_on_turn.name} you won!!"
  else
    puts "Sorry none of you won"
  end
end

def welcome_screen
  welcome = "WELCOME TO THE TIC TAC TOE GAME!"
  welcome = "#{'*' * welcome.length}\n#{welcome}\n#{'*' * welcome.length}"
end

def get_player_info  num_of_player
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
    puts e.to_s
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

def play_again?
  print 'Do you want to play again? (y/n) [default: n]: '
  play_again = gets.chomp.downcase.match(/y|yes/) ? true : false
  system("cls") || system("clear") if play_again
end

main
