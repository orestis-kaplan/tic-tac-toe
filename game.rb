# game class
require_relative('board')
class Game

  attr_reader :board, :player_on_turn

  def initialize(board_dimension, player1_name, player1_sym, player2_name, player2_sym)
    @board = Board.new(board_dimension)
    @player1 = Player.new(player1_name, player1_sym)
    @player2 = Player.new(player2_name, player2_sym)
    @player_on_turn = @player1
  end

  def status

    rows_status = @board.check_rows
    columns_status = @board.check_columns
    main_diagonal_status = @board.check_main_diagonal
    second_diagonal_status = @board.check_second_diagonal
    
    win = [rows_status, columns_status, main_diagonal_status, second_diagonal_status].any? do |status|
      status == Board::WIN
    end

    if(win)
      return Board::WIN
    else
      draw_status = @board.draw
      return draw_status if draw_status == Board::DRAW
    end 
    Board::ON_GAME
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

end