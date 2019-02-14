# class Board
class Board

  DIMENSION = 3

  attr_accessor :size, :table

  def initialize(size)
    @size = size
    @table = Array.new(@size)
    size.times { |pos| @table[pos] = Array.new(size) }
  end

  def graphic_table
    counter = 0
    element = ""

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
      element += '------' + "\n" if (counter % @size).zero?
    end

    element
  end

  def fill_table(position, symbol)
    arr_pos = position_coverter position
    @table[arr_pos[0]][arr_pos[1]] = symbol
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
end