# class Board
class Board
  attr_accessor :size, :table

  def initialize(size)
    @size = size
    @table = Array.new(size)
    size.times { |pos| @table[pos] = Array.new(size) }
  end

  def default_table
    counter = 0
    @table.each do
      element = '-' + '|'
      counter += 1
      puts element.to_s * @size + "\n" + '------' if (counter % 3).zero?
    end
  end

  def fill_table(value, symbol)
    @table[value[0]][value[1]] = symbol
  end
end
