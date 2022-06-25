# frozen_string_literal: true

module GameDisplay
  begin
    # try load Tic Tac Toe sign
    SIGN = File.read('sign.txt').freeze
  rescue StandardError
    SIGN = 'Tic Tac Toe'
  end

  def self.player_id(id)
    "Player #{id}"
  end

  def self.choose_number(name)
    "(#{name}) Choose number to place symbol: "
  end

  def self.invalid_board_number
    'Number you selected is invalid!'
  end

  def self.won(name)
    "#{name} won!"
  end

  def self.tie
    'Tie!'
  end

  def self.new_game_question
    'Do you want to play new game(Y/N)? '
  end

  def self.exiting
    'Exiting... :('
  end

  def self.new_game
    'New game began! :)'
  end
end
