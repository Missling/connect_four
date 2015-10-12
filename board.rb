class Board
  attr_reader :board, :rows, :columns

  def initialize (columns, rows)
    @columns = columns
    @rows = rows

    @board = create_board
  end

  def display
    print "\n"
    row = rows - 1
    
    until row < 0 do
      column = columns - 1

      until column < 0 do
        if board[column][row] == nil
          print '_ '
        else 
          print "#{board[column][row]} "
        end 
        column -= 1
      end
      puts ""
      row -= 1
    end
  end

  def current_piece(column)
    board[column].last
  end

  def current_piece_row(column)
    board[column].length - 1
  end

  def piece(column, row)
    board[column][row]
  end

  def play(piece, column)
    board[column] << piece
  end

  def valid_space?(column, row)
    valid_column?(column) && valid_row?(row)
  end

  def valid_column?(column)
    column >= 0 && column < columns
  end

  def valid_row?(row)
    row >= 0 && row < rows
  end

  def full_column?(column)
    board[column].length >= rows
  end

  private

  def create_board
    new_board = []
    
    columns.times do
      new_board << []
    end
    
    new_board
  end  
end