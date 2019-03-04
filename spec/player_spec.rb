require ('./lib/player')
require ('./lib/main')

describe "setup_player" do
  it "return the default name of the first player" do
    name = ""
    #player = Player.new(name,Player::PLAYER1_SYMBOL)
    expect(name).to eql(Player::PLAYER1_NAME)
  end
  it "return the default name of the second player" do
    name = ""
    player = Player.new(name,Player::PLAYER2_SYMBOL)
    expect(player.name).to eql(Player::PLAYER2_NAME)
  end
end
