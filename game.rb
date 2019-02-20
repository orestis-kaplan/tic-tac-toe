# game class
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
    puts "value of rows_status: #{rows_status}"
    return rows_status if rows_status == Board::WIN

    columns_status = @board.check_columns
    puts "value of columns_status: #{columns_status}"
    return columns_status if columns_status == Board::WIN

    main_diagonal_status = @board.check_main_diagonal
    puts "value of md_status: #{main_diagonal_status}"
    return main_diagonal_status if main_diagonal_status == Board::WIN

    second_diagonal_status = @board.check_second_diagonal
    puts "value of sd_status: #{second_diagonal_status}"
    return second_diagonal_status if second_diagonal_status == Board::WIN

    draw_status = @board.draw
    puts "value of draw_status: #{draw_status}"
    return draw_status if draw_status == Board::DRAW
    
    
  end

  def make_a_move move
    @player1.play(move)
    @board.fill_table(@player1.value, @player1.symbol)
    @player1, @player2 = @player2, @player1
  end

end