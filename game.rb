module Game
  class Board
    attr_accessor :board_values

    def initialize
      @board_values = Array.new(3) { Array.new(3, " ") }
    end

    def print_board
      puts "            ⇢     "
      puts ""
      puts "        1   2   3"
      puts ""
      puts "    1   #{@board_values[0][0]} | #{@board_values[0][1]} | #{@board_values[0][2]} "
      puts "       -----------"
      puts "⇣   2   #{@board_values[1][0]} | #{@board_values[1][1]} | #{@board_values[1][2]} "
      puts "       -----------"
      puts "    3   #{@board_values[2][0]} | #{@board_values[2][1]} | #{@board_values[2][2]} "
    end
  end
end

board = Game::Board.new()
board.print_board
