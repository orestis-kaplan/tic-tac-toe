# game class
require('board')
require('player')
class Game

  attr_reader :board, :player_on_turn, :player1, :player2

  def initialize(board_dimension)
    @board = Board.new(board_dimension)
    @player1 = Player.new
    @player2 = Player.new
    @player_on_turn = @player1
    @players = [@player1, @player2]
  end

  def status
    return @board.return_status
  end

  def still_active? status
     status == Board::ON_GAME
  end

  def resolve_game? status
     if status == Board::WIN
       switch_players
       return true
     else
       return false
     end
  end

  def make_a_move move
    @player_on_turn.play(move)
  end

  def fill_table
    @board.fill_table(@player_on_turn.value, @player_on_turn.symbol)
  end

  def switch_players
    @player1, @player2 = @player2, @player1
    @player_on_turn = @player1
  end

  def paint_table
    @board.graphic_table
  end

  def paint_table_guide
    @board.table_guide
  end

  def set_player(index, name, symbol)
    @players[index].name = name
    @players[index].symbol = symbol

    @players[index].checks_players
  end

end
