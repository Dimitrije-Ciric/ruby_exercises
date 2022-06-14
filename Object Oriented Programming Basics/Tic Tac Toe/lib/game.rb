# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# tic tac toe game class
class Game
  begin
    # try load Tic Tac Toe sign
    SIGN = File.read('sign.txt').freeze
  rescue StandardError
    SIGN = 'Tic Tac Toe'
  end

  def self.score_table(player1, player2)
    # max name length
    max_name = [player1.name.length, player2.name.length].max
    # max score length
    max_score = [player1.score.to_s.length, player2.score.to_s.length].max

    puts "┌#{'─' * max_name}┬#{'─' * max_score}┐"
    puts "│#{player1.name + ' ' * (max_name - player1.name.length)}│#{player1.score}│"
    puts "│#{player2.name + ' ' * (max_name - player2.name.length)}│#{player2.score}│"
    puts "└#{'─' * max_name}┴#{'─' * max_score}┘"
  end

  def self.end_game?(board, current_player)
    if board.win?
      puts '', board, "\n#{current_player.name} won!"
      current_player.score += 1
      true
    elsif board.full?
      puts '', board, 'Tie!'
      true
    else
      false
    end
  end

  def self.play_turn(player, board)
    loop do
      puts
      puts board
      print "(#{player.name}) Choose number to place symbol: "
      cell_number = gets.to_i
      break if board.place?(cell_number, player.symbol)

      puts 'Number you selected is invalid!'
    end
  end

  def self.single_game(player_starts, player1, player2)
    board = Board.new
    current_player = player_starts
    loop do
      play_turn(current_player, board) # play single turn

      break if end_game?(board, current_player) # check for game end

      current_player = (current_player.eql?(player1) ? player2 : player1) # swap players
    end

    repeat_game(player_starts, player1, player2) # ask for new game
  end

  def self.repeat_game(player_starts, player1, player2)
    puts score_table(player1, player2)

    print 'Do you want to play new game(Y/N)? '
    unless gets[0].upcase.eql?('Y')
      puts "\n\nExiting... :("
      return
    end
    puts "\n\nNew game began! :)"

    single_game((player_starts.eql?(player1) ? player2 : player1), player1, player2)
  end

  private_class_method :score_table, :end_game?, :play_turn, :single_game, :repeat_game

  def self.run
    puts SIGN, "\n" # displays Tic Tac Toe sign

    # create players
    player1 = Player.new(1)
    puts
    player2 = Player.new(2)

    single_game(player1, player1, player2) # plays single game
  end
end
