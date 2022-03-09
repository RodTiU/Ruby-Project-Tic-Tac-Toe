require "./game.rb"

board = Game::Board.new()
board.print_board

puts "Player 1 name:"
player1_name = gets.chomp
puts "Player 1 symbol:"
player1_symbol = gets.chomp

puts "Player 2 name:"
player2_name = gets.chomp
puts "Player 2 symbol:"
player2_symbol = gets.chomp

game = Game::StartGame.new(player1_name, player1_symbol, player2_name, player2_symbol)
