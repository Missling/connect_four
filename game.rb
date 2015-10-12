require "./win_check"

class Game
  attr_reader :win_length, :columns, :rows, :board

  def initialize(win_length, board)
    @win_length = win_length
    @current_player = 1
    @board = board
  end

  def start_move
    puts "player #{@current_player}, pick a column"

    column = gets.chomp.to_i

    unless board.valid_column?(column) && !board.full_column?(column)
      print "invalid column, please select again\n"
      start_move
      return 
    end

    board.play(@current_player, column)
    
    board.display
    
    win_check = WinCheck.new(self)

    if win_check.win?(column)
      puts "player #{@current_player} wins!"
      return
    end

    switch_player

    start_move
  end

  private

  def switch_player
    if @current_player == 1
      @current_player = 2
    else
      @current_player = 1
    end
  end
end