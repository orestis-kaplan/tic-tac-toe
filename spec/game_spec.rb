require './lib/game'
require './lib/board'

describe Game do
  describe "#check_rows" do
    it "returns WIN of rows" do
      board = Board.new(3)
      board.table = [['X','X','X'],[nil,nil,nil],[nil,nil,nil]]
  	  game = Game.new
  	  expect(game.check_rows(board)).to eql(Game::WIN)
    end
  end
  describe "#check_columns" do
    it "return WIN of columns" do
      board = Board.new(3)
      board.table = [['X',nil,nil],['X',nil,nil],['X',nil,nil]]
      game = Game.new
      expect(game.check_columns(board)).to eql(Game::WIN)
    end
  end
  describe "#check_main_diagonal" do
    it "return WIN of main_diagonal" do
      board = Board.new(3)
      board.table = [['X',nil,nil],[nil,'X',nil],[nil,nil,'X']]
      game = Game.new
      expect(game.check_main_diagonal(board)).to eql(Game::WIN)
    end
  end
  describe "#check_second_diagonal" do
    it "return WIN of check_second_diagonal" do
      board = Board.new(3)
      board.table = [[nil,nil,'X'],[nil,'X',nil],['X',nil,nil]]
      game = Game.new
      expect(game.check_second_diagonal(board)).to eql(Game::WIN)
    end
  end
  describe "#draw" do
    it "return DRAW of draw" do
      board = Board.new(3)
      board.table = [['O','O','X'],['X','X','O'],['O','X','O']]
      game = Game.new
      expect(game.draw(board)).to eql(Game::DRAW)
    end
  end
end
