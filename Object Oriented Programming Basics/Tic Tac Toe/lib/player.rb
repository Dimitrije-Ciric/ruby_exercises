# frozen_string_literal: true

# holds player state(name, symbol, current score)
class Player
  attr_accessor :name, :symbol, :score

  def initialize(name, symbol)
    self.name = name
    self.symbol = symbol
    @score = 0
  end
end
