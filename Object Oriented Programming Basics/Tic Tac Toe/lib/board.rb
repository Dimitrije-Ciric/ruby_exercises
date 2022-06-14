# frozen_string_literal: true

# holds Board states
class Board
  WIN_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  def initialize
    i = 0
    @board = Array.new(9) { i += 1 }
  end

  def to_s
    ["┌───┬───┬───┐\n",
     "│ #{@board[0]} │ #{@board[1]} │ #{@board[2]} │\n",
     "├───┼───┼───┤\n",
     "│ #{@board[3]} │ #{@board[4]} │ #{@board[5]} │\n",
     "├───┼───┼───┤\n",
     "│ #{@board[6]} │ #{@board[7]} │ #{@board[8]} │\n",
     '└───┴───┴───┘'].reduce { |return_string, curr_string| return_string + curr_string }
  end

  def place?(cell_number, symbol)
    if cell_number.positive? && @board[cell_number - 1].instance_of?(Integer)
      @board[cell_number - 1] = symbol
      true
    else
      false
    end
  end

  def win?
    WIN_COMBOS.any? do |combo|
      [@board[combo[0]], @board[combo[1]], @board[combo[2]]].uniq.length == 1
    end
  end

  def full?
    @board.all? { |cell| cell.instance_of?(String) }
  end
end
