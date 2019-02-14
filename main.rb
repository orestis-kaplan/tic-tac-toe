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

    puts "Enter the value from 1 to #{board.size**2}"
    print "#{player1.name} your turn: "
    next_move = gets.strip.to_i
    player1.play(next_move)
    board.fill_table(player1.value, player1.symbol)
    
    puts table_guide(board.size)
    puts "********************"
    puts board.graphic_table
    result = game.win?(board)

    if result == false
      print "#{player2.name} your turn: "
      next_move = gets.strip.to_i
      player2.play(next_move)
      board.fill_table(player2.value, player2.symbol)

      puts table_guide(board.size)
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

def table_guide dimension
 table_str = ""
 (1..dimension**2).each do |num|
   table_str += "#{num}" + '|'
   if(num % dimension).zero?
     table_str += "\n" + '------' + "\n"
   end
 end
 table_str
end

main
