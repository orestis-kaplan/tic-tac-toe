# class player
class Player
  attr_accessor :value, :symbol
  def initialize(name, symbol)
    @symbol = symbol
    @name = name
    @value = nil
  end

  def play(value)
    @value = value
  end
end
