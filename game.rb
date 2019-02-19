# game class
class Game
  
  attr_accessor :column, :main_diagonal, :second_diagonal, :column_matrix

  WIN = 'win'
  DRAW = 'draw'
  ON_GAME = 'on_game'

  def initialize
    @columns = []
    @main_diagonal = []
    @second_diagonal = []
  end

  def status(board)
    
    for i in board.table
      if i.all?{ |inner| inner == 'X' }
        return WIN
      elsif i.all? { |inner| inner == 'O' }
        return WIN
      end
    end
    
    board_columns = check_columns board
    for i in board_columns
      if i.all?{ |inner| inner == 'X' }
        return WIN
      elsif i.all? { |inner| inner == 'O' }
        return WIN
      end
    end

    board_diagonal = check_main_diagonal board
    if board_diagonal.all?{ |inner| inner == ['X'] }
      return WIN
    elsif board_diagonal.all? { |inner| inner == ['O'] }
      return WIN
    end

    board_diagonal = check_second_diagonal board
    if board_diagonal.all?{ |inner| inner == ['X'] }
      return WIN
    elsif board_diagonal.all? { |inner| inner == ['O'] }
      return WIN
    end

    if board.table.flatten.none?{ |inner| inner == nil }
      return DRAW
    end
    
    ON_GAME
  end

  private

  def check_columns board
    column_matrix = []
    for i in 0...board.table.length
      for j in 0...board.table.length
        @columns << board.table[j][i]
      end
      column_matrix << @columns
      @columns = []
    end

    column_matrix
  end

  def check_main_diagonal board
    main_diagonal_matrix = []
    for i in 0...board.table.length
      for j in 0...board.table.length
        if j == i
          @main_diagonal << board.table[j][i]
        end
      end
      main_diagonal_matrix << @main_diagonal
      @main_diagonal = []
    end

    main_diagonal_matrix
  end

  def check_second_diagonal board
    second_diagonal_matrix = []
    for i in 0...board.table.length
      for j in 0...board.table.length
        if (j == board.table.size - i - 1)
          @second_diagonal << board.table[i][j]
        end
      end
      second_diagonal_matrix << @second_diagonal
      @second_diagonal = []
    end

    second_diagonal_matrix
  end
end