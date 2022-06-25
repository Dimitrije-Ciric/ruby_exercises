# frozen_string_literal: true

# holds player state(name, symbol, current score)
class Player
  attr_reader :name, :symbol, :score

  MIN_NAME_LENGTH = 3
  MAX_NAME_LENGTH = 20

  @@reserved_names = []
  @@reserved_symbols = []

  def initialize(name, symbol)
    self.name = name
    self.symbol = symbol
    @score = 0
  end

  def self.reserved_name?(name)
    @@reserved_names.include?(name)
  end

  def self.min_name_length
    MIN_NAME_LENGTH
  end

  def self.max_name_length
    MAX_NAME_LENGTH
  end

  def self.valid_name?(name)
    name.length.between?(MIN_NAME_LENGTH, MAX_NAME_LENGTH)
  end

  def self.reserved_symbol?(symbol)
    @@reserved_symbols.include?(symbol)
  end

  def self.valid_symbol?(symbol)
    symbol.length == 1
  end

  private

  def name=(name)
    @name = name
    @@reserved_names |= [name]
  end

  def symbol=(symbol)
    @symbol = symbol
    @@reserved_symbols |= [symbol]
  end

  public

  def increment_score
    @score += 1
  end
end
