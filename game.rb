# game class
class Game
  def win?(board)
    if board.size < 3
      puts 'Board size must be greater or equal to 3'
      false
    else
      main_diagonal = Array.new(3)
      second_diagonal = Array.new(3)
      for i in board.table
        if i.all?{ |inner| inner == 'X' }
          return true
        elsif i.all? { |inner| inner == 'O' }
          return true
        end
      end
      for i in 0...board.table.length
           column = Array.new(3)
        for j in (0...board.table.length)
          column.push(board.table[j][i])
          if i == j # main diagonal
              main_diagonal.push(board.table[j][i])
          elsif j == board.table.size - i - 1 && i == j
              second_diagonal << board.table[i][j]
          end
        end
        puts column
        if column.all? { |element| element == 'X' } || main_diagonal.all? { |element| element == 'X' } || second_diagonal.all? { |element| element == 'X' }
          puts "true"
          return true
        elsif column.all? { |element| element == 'O' } || main_diagonal.all? { |element| element == 'O' } || second_diagonal.all? { |element| element == 'O' }
          return true
        else
          return false
        end
      end
    end
  end
end
