# frozen_string_literal: true

# holds player state(name, symbol, current score)
class Player
  attr_reader :name, :symbol
  attr_accessor :score

  @@reserved_names = []
  @@reserved_symbols = []

  def initialize(id)
    puts "Player #{id}"

    loop do
      print 'Enter your name: '
      break if set_name(gets.chomp)
    end

    loop do
      print 'Enter your 1 character symbol: '
      break if set_symbol(gets.chomp)
    end

    @score = 0
  end

  private

  def set_name(name)
    if name.length.between?(3, 20)
      unless @@reserved_names.any?(name)
        @name = name
        @@reserved_names << name
        return true
      end

      puts 'Players must have different names'
    else
      puts 'Name must have 3 to 20 characters'
    end

    false
  end

  def set_symbol(symbol)
    if symbol.length.eql?(1)
      unless @@reserved_symbols.any?(symbol)
        @symbol = symbol
        @@reserved_symbols << symbol
        return true
      end

      puts 'Players must have different symbols'
    else
      puts 'Symbol must have only 1 character'
    end
    
    false
  end
end
