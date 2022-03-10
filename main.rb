require "./game.rb"

board = Game::Board.new()
game = Game::StartGame.new()

board.print_board

player1 = {
  name: game.player1_name,
  symbol: game.player1_symbol,
}

player2 = {
  name: game.player2_name,
  symbol: game.player2_symbol,
}

loop do
  player1_move = game.player_move(player1[:name], player1[:symbol], board.board_values)
  board.print_board

  break if game.search_winner(board.board_values)

  player2_move = game.player_move(player2[:name], player2[:symbol], board.board_values)
  board.print_board

  break if game.search_winner(board.board_values)
end
