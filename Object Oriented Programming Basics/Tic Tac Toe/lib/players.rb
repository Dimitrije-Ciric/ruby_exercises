# frozen_string_literal: true

require 'English'
require_relative 'player'
require_relative 'create_player_display'

class Players
  def initialize(number_of_players)
    @players = Array.new(number_of_players) { |idx| Players.create_player(idx + 1) }
    @player_turn = @starting_player = 0
  end

  def new_game
    @player_turn = @starting_player = (@starting_player + 1) % @players.length
  end

  def new_turn
    @player_turn = (@player_turn + 1) % @players.length
  end

  def current_player
    @players[@player_turn]
  end

  def [](idx)
    @players[idx]
  end

  def self.create_player(id)
    puts CreatePlayerDisplay.player_id(id)

    Player.new(enter_name, enter_symbol)
  end

  def self.enter_name
    print CreatePlayerDisplay.enter_name
    gets

    if Player.reserved_name?($LAST_READ_LINE.chomp!)
      puts CreatePlayerDisplay.same_name_error
    elsif !Player.valid_name?($LAST_READ_LINE)
      puts CreatePlayerDisplay.name_length_error(Player.min_name_length, Player.max_name_length)
    else
      return $LAST_READ_LINE
    end

    enter_name
  end

  def self.enter_symbol
    print CreatePlayerDisplay.enter_symbol
    gets

    if Player.reserved_symbol?($LAST_READ_LINE.chomp!)
      puts CreatePlayerDisplay.same_symbol_error
    elsif !Player.valid_symbol?($LAST_READ_LINE)
      puts CreatePlayerDisplay.symbol_length_error
    else
      return $LAST_READ_LINE
    end

    enter_symbol
  end

  def to_s
    # max name length
    max_name = (@players.map { |player| player.name.length }).max
    # max score length
    max_score = (@players.map { |player| player.score.to_s.length }).max

    score_table = "┌#{'─' * max_name}┬#{'─' * max_score}┐\n"

    @players.each do |player|
      score_table += "│#{player.name.ljust(max_name)}│#{player.score.to_s.ljust(max_score)}│\n"
    end

    score_table += "└#{'─' * max_name}┴#{'─' * max_score}┘"
  end

  private_class_method :enter_name, :enter_symbol
end
