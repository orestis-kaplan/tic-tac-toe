$LOAD_PATH << '.'
require('board')
require('game')
require('player')

def main
  game = Game.new

  print "Please enter the dimension of the table: "
  dimension = gets.strip.to_i
  board = Board.new(dimension)

  print 'Please insert the name of the player 1: '
  player_one_name = gets.chomp
  print 'Please insert the name of the player 2: '

  player_two_name = gets.chomp
  player1 = Player.new(player_one_name, 'X')
  player2 = Player.new(player_two_name, 'O')

  boolean = true
  while boolean

    print "#{player1.name} your turn: "
    next_move = gets.strip.to_i
    player1.play(next_move)
    board.fill_table(player1.value, player1.symbol)

    puts board.graphic_table
    result = game.win?(board)

    if result == false
      print "#{player2.name} your turn: "
      next_move = gets.strip.to_i
      player2.play(next_move)
      board.fill_table(player2.value, player2.symbol)

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

main
