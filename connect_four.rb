require "./board"
require "./game"
require "./win_check"

class ConnectFour
  attr_reader :game, :board

  def initialize(columns, rows, win_length)
    @board = Board.new(columns, rows)
    @game = Game.new(win_length, board)
  end

  def start
    game.start_move
  end

  def play(player, column)
    board.play(player, column)
  end

  def display
    board.display
  end

  def win?(column)
    win_check = WinCheck.new(game)
    win_check.win?(column)
  end
end
