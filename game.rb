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

    def player_move(player, player_symbol, board)
      # initialize variables to repeat_move function
      @last_player = player
      @last_player_symbol = player_symbol
      @last_board = board

      puts "#{player} move in ⇣"
      @move_v = gets.chomp

      puts "#{player} move in ⇢"
      @move_h = gets.chomp

      if !(1..3).include?(@move_v.to_i) || !(1..3).include?(@move_h.to_i)
        puts "Not valid move, out of range!"
        repeat_move()
      elsif board[@move_v.to_i - 1][@move_h.to_i - 1] != " "
        puts "Repeat move, square is occupied!"
        repeat_move()
      else
        board[@move_v.to_i - 1][@move_h.to_i - 1] = player_symbol
      end
    end

    def repeat_move
      player_move(@last_player, @last_player_symbol, @last_board)
    end

    def search_winner(board)
      winner_detector = false

      if board[0][0] != " "
        if ((board[0][0] == board[1][1] && board[0][0] == board[2][2]) ||
            (board[0][0] == board[0][1] && board[0][0] == board[0][2]) ||
            (board[0][0] == board[1][0] && board[0][0] == board[2][0]))
          winner board[0][0]
          winner_detector = true
        end
      end

      if board[0][2] != " "
        if ((board[0][2] == board[1][1] && board[0][2] == board[2][0]) ||
            (board[0][2] == board[1][2] && board[0][2] == board[2][2]))
          winner board[0][2]
          winner_detector = true
        end
      end

      if board[0][1] != " "
        if ((board[0][1] == board[1][1] && board[0][1] == board[2][1]))
          winner board[0][1]
          winner_detector = true
        end
      end

      if board[1][0] != " "
        if (board[1][0] == board[1][1] && board[1][0] == board[1][2])
          winner board[1][0]
          winner_detector = true
        end
      end

      if board[2][0] != " "
        if (board[2][0] == board[2][1] && board[2][0] == board[2][2])
          winner board[2][0]
          winner_detector = true
        end
      end

      winner_detector
    end

    def winner(board_val)
      puts "WINS #{board_val}!"
    end
  end
end
