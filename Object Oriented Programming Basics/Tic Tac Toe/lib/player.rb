# frozen_string_literal: true

# holds player state(name, symbol, current score)
class Player
  attr_reader :name, :symbol
  attr_accessor :score

  @@reserved_names = []
  @@reserved_symbols = []

  def initialize(id)
    puts "Player #{id}"

    enter_name
    enter_symbol

    @score = 0
  end

  private

  def self.valid_name?(name)
    if name.length.between?(3, 20)
      return true unless @@reserved_names.any?(name)

      puts 'Players must have different names'
    else
      puts 'Name must have 3 to 20 characters'
    end

    false
  end

  def name=(name)
    @name = name
    @@reserved_names << name
  end

  def enter_name      
    print 'Enter your name: '; gets

    if Player.valid_name?($_.chomp!)
      self.name = $_
    else
      enter_name
    end
  end

  def self.valid_symbol?(symbol)
    if symbol.length == 1
      return true unless @@reserved_symbols.any?(symbol)

      puts 'Players must have different symbols'
    else
      puts 'Symbol must have only 1 character'
    end
    
    false
  end

  def symbol=(symbol)
    @symbol = symbol
    @@reserved_symbols << symbol
  end

  def enter_symbol
    print 'Enter your 1 character symbol: '; gets

    if Player.valid_symbol?($_.chomp!)
      self.symbol = $_
    else
      enter_symbol
    end
  end
end
