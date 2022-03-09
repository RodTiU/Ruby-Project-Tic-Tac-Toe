require "./game.rb"

board = Game::Board.new()
game = Game::StartGame.new()

board.print_board

player1 = game.player1_name
player1_symbol = game.player1_symbol
player2 = game.player2_name
player2_symbol = game.player2_symbol

player1_move = game.player_move(player1)
vertical_move1 = player1_move[0]
horizontal_move1 = player1_move[1]
board.board_values[vertical_move1][horizontal_move1] = player1_symbol
board.print_board

player2_move = game.player_move(player2)
vertical_move2 = player2_move[0]
horizontal_move2 = player2_move[1]
board.board_values[vertical_move2][horizontal_move2] = player2_symbol
board.print_board
