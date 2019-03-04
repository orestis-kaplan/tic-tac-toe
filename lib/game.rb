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

    check_rows(board)

    check_columns(board)

    check_main_diagonal(board)

    check_second_diagonal(board)

    draw(board)
    
    ON_GAME
  end

  #private
    def check_rows board
      for i in board.table
        if i.all?{ |inner| inner == 'X' }
          return WIN
        elsif i.all? { |inner| inner == 'O' }
          return WIN
        end
      end
    end

  def check_columns board
    column_matrix = []
    for i in 0...board.table.length
      for j in 0...board.table.length
        @columns << board.table[j][i]
      end
      column_matrix << @columns
      @columns = []
    end

    for i in column_matrix
      if i.all?{ |inner| inner == 'X' }
        return WIN
      elsif i.all? { |inner| inner == 'O' }
        return WIN
      end
    end

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

    for i in main_diagonal_matrix
      if i.all?{ |inner| inner == 'X' }
        return WIN
      elsif i.all? { |inner| inner == 'O' }
        return WIN
      end
    end

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

    for i in second_diagonal_matrix
      if i.all?{ |inner| inner == 'X' }
        return WIN
      elsif i.all? { |inner| inner == 'O' }
        return WIN
      end
    end
  end

  def draw board
    if board.table.flatten.none?{ |inner| inner == nil }
      return DRAW
    end
  end

end
