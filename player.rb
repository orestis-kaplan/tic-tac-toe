# class player
class Player
  attr_accessor :value, :symbol, :name

  PLAYER1_DEFAULT_SYMBOL = 'X'
  PLAYER1_DEFAULT_NAME = 'Player 1'
  PLAYER2_DEFAULT_SYMBOL = 'O'
  PLAYER2_DEFAULT_NAME = 'Player 2'

  @@player1_name_active = false

  def initialize(name, symbol)
    @symbol = symbol
    @name = name
    @value = nil
    checks_players
  end

  def play(value)
    @value = value
  end

  def checks_players
    if @@player1_name_active
      # second player conditions
      if @name.empty?
        @name = PLAYER2_DEFAULT_NAME
        @symbol = PLAYER2_DEFAULT_SYMBOL
        @@player1_name_active = false
      end
    else
      # first player conditions
      if @name.empty?
        @name = PLAYER1_DEFAULT_NAME
        @symbol = PLAYER1_DEFAULT_SYMBOL
        @@player1_name_active = true
      end
    end
  end

end
