$LOAD_PATH << '.'
require('board')
require('game')
require('player')

def main
  game = Game.new

  puts welcome_screen

  print "Please enter the dimension of the table: "
  dimension = gets.strip.to_i
  board = Board.new(dimension)

  # Setting up information for first player
  print 'Please insert the name of the player 1: '
  player_name = gets.chomp.capitalize!
  print 'Select your symbol[default: X]: '
  player_sym = gets.strip.upcase
  player_sym = player_sym == "" ? Player::PLAYER1_SYMBOL : player_sym

  player1 = Player.new(player_name, player_sym)
  
  # Setting up information for second player
  print 'Please insert the name of the player 2: '
  player_name = gets.chomp.capitalize!
  print 'Select your symbol[default: O]: '
  player_sym = gets.strip.upcase
  player_sym = player_sym == "" ? Player::PLAYER2_SYMBOL : player_sym

  player2 = Player.new(player_name, player_sym)

  boolean = true
  while boolean

    puts "Enter the value from 1 to #{board.size**2}"
    print "#{player1.name} your turn: "
    next_move = gets.strip.to_i # add validation for values greater than the table dimension
    player1.play(next_move)
    board.fill_table(player1.value, player1.symbol)

    system "clear"

    puts board.table_guide
    puts "********************"
    puts board.graphic_table
    result = game.win?(board)

    if result == false
      print "#{player2.name} your turn: "
      next_move = gets.strip.to_i # add validation for values greater than the table dimension
      player2.play(next_move)
      board.fill_table(player2.value, player2.symbol)

      system "clear"

      puts board.table_guide
      puts "********************"
      puts board.graphic_table
      result = game.win?(board)

      if result == true
        puts "#{player2.name} you won!!"
        boolean = false
      end
    else
      puts "#{player1.name} you won!!"
      boolean = false
    end
  end
end

def welcome_screen
  welcome = "WELCOME TO THE TIC TAC TOE GAME!"
  welcome = "*"*welcome.length + "\n" + welcome + "\n" + "*"*welcome.length
end

main
