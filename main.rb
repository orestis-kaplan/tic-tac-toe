$LOAD_PATH << '.'
require('board')
require('game')
require('player')

def main
  loop do
    puts welcome_screen

    print "Please enter the dimension of the table [default: 3 (3 means 3x3)]: "
    dimension = gets.strip.to_i

    player_name1, player_sym1 = setup_player(1, Player::PLAYER1_NAME, Player::PLAYER1_SYMBOL)
    
    player_name2, player_sym2 = setup_player(2, Player::PLAYER2_NAME, Player::PLAYER2_SYMBOL)

    game = Game.new(dimension, player_name1, player_sym1, player_name2, player_sym2)

    on_game = true
    play_again = true

    print_table(game.board)

    while on_game

      make_a_move(player1, board)

      system("cls") || system("clear")

      print_table(board)
      game_status = game.status(board)

      if game_status == Game::WIN
        puts "#{player1.name} you won!!"
        on_game = false
      elsif game_status == Game::DRAW
        puts "Sorry none of you won"
        on_game = false
      else
        player1, player2 = player2, player1
      end
    end

    print 'Do you want to play again? (y/n) [default: n]: '
    play_again = gets.chomp == 'y' ? true : false
    on_game = true if play_again
    system("cls") || system("clear") if play_again
    break unless play_again
  end
  puts "Thanks for play this game!"
end

def welcome_screen
  welcome = "WELCOME TO THE TIC TAC TOE GAME!"
  welcome = "*"*welcome.length + "\n" + welcome + "\n" + "*"*welcome.length
end

def setup_player(num_of_player, name, symbol)
  print "Please insert the name of the player #{num_of_player}: "
  player_name = gets.strip.capitalize
  print "Select your symbol[default: #{symbol}]: "
  player_sym = gets.strip.upcase
  player_name = player_name == "" ? name : player_name
  player_sym = player_sym == "" ? symbol : player_sym

  return player_name, player_sym
end

def make_a_move(player, board)
  begin
    puts "Enter the value from 1 to #{board.size**2}"
    print "#{player.name} your turn: "
    next_move = gets.match(/\d+/)[0].to_i
    raise "Please enter a number in the range." unless (next_move).between?(1, board.size**2)
    player.play(next_move)
    raise "Please select an empty position." unless board.fill_table(player.value, player.symbol)
  rescue NoMethodError
    puts "Please enter only numeric values"
    retry
  rescue RuntimeError => e
    puts "#{e}"
    retry
  end
end

def print_table(board)
  puts "TABLE GUIDE"
  puts board.table_guide
  puts "*" * ((board.size * board.size).to_s.length * board.size + board.size)
  puts "TABLE GAME"
  puts board.graphic_table
end

main
