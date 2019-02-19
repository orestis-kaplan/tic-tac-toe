# class player
class Player
  attr_accessor :value, :symbol, :name
  
  PLAYER1_SYMBOL = 'X'
  PLAYER1_NAME = 'Player 1'
  PLAYER2_SYMBOL = 'O'
  PLAYER2_NAME = 'Player 2'

  def initialize(name, symbol)
    @symbol = symbol
    @name = name
    @value = nil
  end

  def play(value)
    @value = value
  end
end
