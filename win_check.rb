require 'pry'

class WinCheck
  attr_reader :board, :win_length

  def initialize(game)
    @board = game.board
    @win_length = game.win_length
  end

  def win?(column)
    column_check?(column) || 
      row_check?(column) || 
      diagonal_top_left_check?(column) ||
      diagonal_top_right_check?(column)
  end

  private

  def get_player(column)
    board.current_piece(column)
  end

  def get_row(column)
    board.current_piece_row(column)
  end

  def column_check?(column)
    player = get_player(column)
    row = get_row(column)

    count = 0
    while board.valid_row?(row) && board.piece(column, row) == player && count != win_length
  
      count += 1
      row -= 1
    end

    count == win_length
  end

  def row_check?(column)
    player = get_player(column)
    row = get_row(column)
    current_column = column 

    count = 0

    while board.valid_column?(current_column) && board.piece(current_column, row) == player && count != win_length 
    
      count += 1  
      current_column -= 1
    end

    current_column = column + 1

    while board.valid_column?(current_column) && board.piece(current_column, row) == player && count != win_length 
   
      current_column += 1
      count += 1
    end

    count == win_length
  end

  def diagonal_top_left_check?(column)
    player = get_player(column)
    row = get_row(column)
    current_column = column
    current_row = row

    count = 0

    while board.valid_space?(current_column, current_row) && board.piece(current_column, current_row) == player && count != win_length

      current_column += 1
      current_row += 1
      count += 1 
    end

    current_column = column - 1
    current_row = row - 1

    while board.valid_space?(current_column, current_row) && board.piece(current_column, current_row) == player && count != win_length

      count += 1
      column -= 1
      row -= 1  
    end

   count == win_length
  end

  def diagonal_top_right_check?(column)
    player = get_player(column)
    row = get_row(column)
    current_column = column
    current_row = row

    count = 0

    while board.valid_space?(current_column, current_row) && board.piece(current_column, current_row) == player && count != win_length
  
      count += 1 
      current_column += 1
      current_row -= 1
    end

    current_column = column - 1
    current_row = row + 1
    
    while board.valid_space?(current_column, current_row) && board.piece(current_column, current_row) == player && count != win_length

      current_column -= 1
      current_row += 1
      count += 1
    end

    count == win_length
  end
end