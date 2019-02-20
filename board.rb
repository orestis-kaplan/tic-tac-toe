# class Board
class Board

  DIMENSION = 3
  WIN = 'win'
  DRAW = 'draw'
  ON_GAME = 'on_game'

  attr_accessor :size, :table, :column, :main_diagonal, :second_diagonal, :column_matrix

  def initialize(size)
    @size = size < 3 ? DIMENSION : size
    @table = Array.new(@size)
    @size.times { |pos| @table[pos] = Array.new(@size) }
    @columns = []
    @main_diagonal = []
    @second_diagonal = []
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

   def check_rows
    for i in @table
      if i.all?{ |inner| inner == 'X' }
        return WIN
      elsif i.all? { |inner| inner == 'O' }
        return WIN
      end
    end
    ON_GAME
  end

  def check_columns
    column_matrix = []
    for i in 0...@table.length
      for j in 0...@table.length
        @columns << @table[j][i]
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
    ON_GAME
  end

  def check_main_diagonal
    main_diagonal_matrix = []
    for i in 0...@table.length
      for j in 0...@table.length
        if j == i
          @main_diagonal << @table[j][i]
        end
      end
      main_diagonal_matrix << @main_diagonal
      @main_diagonal = []
    end

    if main_diagonal_matrix.all?{ |inner| inner == ['X'] }
      return WIN
    elsif main_diagonal_matrix.all? { |inner| inner == ['O'] }
      return WIN
    end
    ON_GAME
  end

  def check_second_diagonal
    second_diagonal_matrix = []
    for i in 0...@table.length
      for j in 0...@table.length
        if (j == @table.size - i - 1)
          @second_diagonal << @table[i][j]
        end
      end
      second_diagonal_matrix << @second_diagonal
      @second_diagonal = []
    end

    if second_diagonal_matrix.all?{ |inner| inner == ['X'] }
      return WIN
    elsif second_diagonal_matrix.all? { |inner| inner == ['O'] }
      return WIN
    end

    ON_GAME
  end

  def draw
    puts "table in draw: #{@table.flatten}"
    if @table.flatten.none?{ |inner| inner == nil }
      return DRAW
    end
    ON_GAME
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