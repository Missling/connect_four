require 'pry'

class ConnectFour
  attr_reader :board, :rows, :columns, :win_length

  def initialize(rows, columns, win_length)
    @rows = rows
    @columns = columns
    @board = create_board
    @win_length = win_length
    @current_player = 1
  end

  def start_move
    puts "player #{@current_player}, pick a column"

    response = gets.chomp 
    return if response == 'exit'
    column = response.to_i

    if column >= columns 
      print "column outside of range\n"
      start_move
      return 
    end

    play(@current_player, column)
    
    display
    
    if win?(column)
      puts "player #{@current_player} wins!"
      return
    end

    switch_player

    start_move
  end

  def play(player, column)
    board[column] << player if board[column].length < rows
  end

  def win?(column)
    return column_check?(column) || 
      row_check?(column) || 
      diagonal_top_left_check?(column) ||
      diagonal_top_right_check?(column)
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

  private

  def switch_player
    if @current_player == 1
      @current_player = 2
    else
      @current_player = 1
    end
  end

  def create_board
    new_board = []
    columns.times do
      new_board << []
    end
    return new_board
  end  


  def column_check?(column)
    player = board[column].last
    row = board[column].length - 1

    count = 0
    until !(board[column] && board[column][row] == player) || count == win_length do 
      count +=1
      row -= 1
      break if row < 0 
    end

    return count == win_length
  end

  def row_check?(column)
    player = board[column].last
    row = board[column].length - 1
    new_column = column 

    count = 0
    until !(board[new_column] && board[new_column][row] == player) || count == win_length do
      count += 1  
      new_column -= 1
      break if new_column < 0
    end

    column = column + 1

    until !(board[column] && board[column][row] == player) || count == win_length do
      column += 1
      count += 1
    end

    return count == win_length
  end

  def diagonal_top_left_check?(column)
    player = board[column].last
    row = board[column].length - 1
    new_column = column
    new_row = row

    count = 0
    until !(board[new_column] && board[new_column][new_row] == player) || count == win_length do
      new_column += 1
      new_row += 1
      count += 1 
    end

    column = column - 1
    row = row - 1
    until !(board[column] && board[column][row] == player) || count == win_length do
      count += 1
      column -= 1
      row -= 1
      break if column < 0 || row < 0
    end

    return count == win_length
  end

  def diagonal_top_right_check?(column)
    player = board[column].last
    row = board[column].length - 1
    new_column = column
    new_row = row

    count = 0
    until !(board[new_column] && board[new_column][new_row] == player) || count == win_length do
      count += 1 
      new_column += 1
      new_row -= 1
      break if new_column < 0 || new_row < 0
    end

    column = column - 1
    row = row + 1
    until !(board[column] && board[column][row] == player) || count == win_length do
      column -= 1
      row += 1
      count += 1
    end

    return count == win_length
  end
end

game = ConnectFour.new(3,3,3)
game.start_move