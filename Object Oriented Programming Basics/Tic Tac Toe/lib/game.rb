# frozen_string_literal: true

require_relative 'players'
require_relative 'board'
require_relative 'game_display'

# tic tac toe game class
module Game
  def self.play_turn(player, board)
    loop do
      puts
      puts board
      print GameDisplay.choose_number(player.name)
      cell_number = gets.to_i
      break if board.place?(cell_number, player.symbol)

      GameDisplay.invalid_board_number
    end
  end

  def self.single_game(players)
    board = Board.new
    loop do
      current_player = players.current_player

      play_turn(current_player, board) # play single turn

      if board.win?
        puts board, GameDisplay.won(current_player.name)
        current_player.increment_score
        break
      elsif board.full?
        puts board, GameDisplay.tie
        break
      end

      players.new_turn
    end

    puts players
    repeat_game(players) # ask for new game
  end

  def self.repeat_game(players)
    print GameDisplay.new_game_question
    unless gets[0].upcase.eql?('Y')
      puts GameDisplay.exiting
      return
    end
    puts GameDisplay.new_game

    players.new_game
    single_game(players)
  end

  def self.run
    puts GameDisplay::SIGN, "\n"

    players = Players.new(2)

    single_game(players) # plays single game
  end
end
