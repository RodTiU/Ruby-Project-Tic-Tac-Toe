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
      puts ""
    end
  end

  class StartGame
    attr_reader :player1_name, :player2_name, :player1_symbol, :player2_symbol

    def initialize
      puts "Player 1 name:"
      @player1_name = gets.chomp
      puts "Player 1 symbol:"
      @player1_symbol = gets.chomp

      puts "Player 2 name:"
      @player2_name = gets.chomp
      puts "Player 2 symbol:"
      @player2_symbol = gets.chomp
    end

    def get_names
      puts "#{@player1_name} is player 1 with symbol #{@player1_symbol}, #{@player2_name} is player 2 with symbol #{@player2_symbol}"
    end

    def player_move(player)
      puts "#{player} move in ⇣"
      @move_v = gets.chomp
      puts "#{player} move in ⇢"
      @move_h = gets.chomp
      [@move_v.to_i - 1, @move_h.to_i - 1]
    end
  end
end
