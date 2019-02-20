# class Board
class Board

  DIMENSION = 3
  WIN = 'win'
  DRAW = 'draw'
  ON_GAME = 'on_game'

  attr_accessor :size, :table, :column, :main_diagonal, :second_diagonal, :column_matrix
  attr_reader :board_status

  def initialize(size)
    @size = size < 3 ? DIMENSION : size
    @table = Array.new(@size)
    @size.times { |pos| @table[pos] = Array.new(@size) }
    @columns = []
    @main_diagonal = []
    @second_diagonal = []
    @board_status = ON_GAME
  end

  def graphic_table
    counter = 0
    element = division = ""

    for i in (0...@size)
      for j in (0...@size)
      
        if @table[i][j].nil?
          element += '-' + '|'
        else
          element += @table[i][j].to_s + '|'
        end
        counter += 1
      end
      element += "\n"
      division = '-' * (@size * 2) + "\n" if (counter % @size).zero?
      element += division
    end

    element
  end

  def fill_table(position, symbol)
    arr_pos = position_coverter position
    if empty_position? arr_pos
      @table[arr_pos[0]][arr_pos[1]] = symbol
      return true
    else
      return false
    end
  end

  def table_guide
    table_str = ""
    (1..@size**2).each do |num|
      table_str += "#{num}" + ' ' * ((@size * @size).to_s.length - num.to_s.length) + '|'
      if(num % @size).zero?
        table_str += "\n" + '-' * ((@size * @size).to_s.length * @size + @size) + "\n"
      end
    end
    table_str
   end

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

  private

  def position_coverter position
    row = col = 0

    for i in (1...position)
      if i % @size == 0
        row += 1
      end
    end
    [row, position - @size * row - 1]
  end

  def empty_position?(arr_pos)
    @table[arr_pos[0]][arr_pos[1]] == nil
  end
end