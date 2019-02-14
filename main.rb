$LOAD_PATH << '.'
require('board')
require('game')
require('player')
def main
  game = Game.new
  board = Board.new(3)
  puts 'Player 1 Name'
  player_one_name = gets.chomp
  puts 'Player 2 Name'
  player_two_name = gets.chomp
  player1 = Player.new(player_one_name, 'X')
  player2 = Player.new(player_two_name, 'O')
  boolean = true
  while boolean
    puts 'Player 1 PLays'
    next_move = gets.strip.split.map {|i| i.to_i}
    player1.play(next_move)
    board.fill_table(player1.value, player1.symbol)
    puts board.table
    result = game.win?(board)
    if result == false
      puts 'Player 2 PLays'
      next_move = gets.strip.split.map {|i| i.to_i}
      player2.play(next_move)
      board.fill_table(player2.value, player2.symbol)
      puts board.table
      result = game.win?(board)
      if result == true
        puts 'Player 2 Wins'
        boolean = false
      end
    else
      puts 'Player 1 Wins'
      boolean = false
    end
  end
end

main
