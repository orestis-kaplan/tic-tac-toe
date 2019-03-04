require './lib/board'

describe "allows to initialize the size of the board" do

  it "returns a board of 3x3" do
    dimension = 0
    board = Board.new(dimension)
    expect(board.size).to eql(3)
  end
end
