# class Board
class Board

  DIMENSION = 3
  WIN = 'win'
  DRAW = 'draw'
  ON_GAME = 'on_game'

  attr_reader :table, :size

  def initialize(size)
    @size = size < 3 ? DIMENSION : size # size never gets nil, at least it will be "" or 0 in our case
    @table = Array.new(@size)
    @size.times { |pos| @table[pos] = Array.new(@size) }
  end

  def graphic_table
    counter = 0
    element = division = ""

    @table.each do |rows|
      element += rows.map{ |val|  val.nil? ? '-|' : "#{val}|" }.join
      element += "\n"
      division = "#{'-' * (@size * 2)} \n" if (counter % @size).zero?
      element += division
    end

    element
  end

  def fill_table(position, symbol)
    write_cell(position, symbol) if empty_position? position
  end

  def table_guide
    table_str = ""
    (1..@size**2).each do |num|
      table_str += "#{num}#{ ' ' * ((@size * @size).to_s.length - num.to_s.length) }|"
      if(num % @size).zero?
        table_str += "\n"
        table_str += "#{'-' * ((@size * @size).to_s.length * @size + @size)} \n"
      end
    end
    table_str
   end

  def check_rows
    won = @table.any? do |row|
      row.uniq.size <= 1 && row.uniq != [nil]
    end
    won ? WIN : ON_GAME
  end

  def check_columns
    column_matrix = []

    @size.times do |pos|
      column_matrix << @table.map do |rows|
        rows[pos]
      end
    end

    won = column_matrix.any? do |column|
      column.uniq.size <= 1 && column.uniq != [nil]
    end
    won ? WIN : ON_GAME
  end

  def check_main_diagonal

    main_diagonal = @table.map.with_index do |rows, i|
      rows[i]
    end

    return status = (main_diagonal.uniq.size <= 1 && main_diagonal.uniq != [nil]) ? WIN : ON_GAME
  end

  def check_second_diagonal
    second_diagonal = @table.map.with_index do |rows, i|
      rows[@size - i - 1]
    end

    return (second_diagonal.uniq.size <= 1 && second_diagonal.uniq != [nil]) ? WIN : ON_GAME
  end

  def draw
    return (@table.flatten.none?{ |inner| inner.nil? }) ? DRAW : ON_GAME
  end

  def empty_position?(position)
    arr_pos = position_coverter position
    @table[arr_pos[0]][arr_pos[1]].nil?
  end

  private

  def position_coverter position
    row = 0

    (1...position).each{ |i| row += 1 if i % @size == 0 }

    [row, position - @size * row - 1]
  end

  def write_cell(position, symbol)
    arr_pos = position_coverter position
    @table[arr_pos[0]][arr_pos[1]] = symbol
    p @table
  end

end