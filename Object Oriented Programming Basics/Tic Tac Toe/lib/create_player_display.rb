# frozen_string_literal: true

module CreatePlayerDisplay
  def self.player_id(id)
    "Player #{id}"
  end

  def self.same_name_error
    'Players must have different names'
  end

  def self.name_length_error(min, max)
    "Name must have #{min} to #{max} characters"
  end

  def self.enter_name
    'Enter your name: '
  end

  def self.same_symbol_error
    'Players must have different symbols'
  end

  def self.symbol_length_error
    'Symbol must have only 1 character'
  end

  def self.enter_symbol
    'Enter your 1 character symbol: '
  end
end
