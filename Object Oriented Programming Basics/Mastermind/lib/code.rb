# frozen_string_literal: true

class Code
  attr_reader :code

  def initialize(code = Code.random)
    self.code = code
  end

  def self.random
    Array.new(4) { Random.rand(1..6) }
  end

  def code=(code)
    if code.respond_to?(:split)
      @code = code.split('').reject { |element| element.eql?(' ') }
      @code.map!(&:to_i)
    else
      @code = code
    end
  end

  def length
    code.length
  end

  def valid_digits?
    code.all? { |digit| digit.to_i.between?(1, 6) }
  end

  def ==(other)
    code == other.code if other.respond_to?(:code)
  end

  def hash
    code.hash
  end

  def eql?(other)
    other.instance_of?(Code) && hash == other.hash
  end

  protected

  def [](idx)
    code[idx]
  end

  public

  def to_s
    code.join('')
  end

  def correct_placed_digits(correct_code)
    correct_placed = 0

    (0...4).each do |i|
      correct_placed += 1 if code[i] == correct_code[i]
    end

    correct_placed
  end

  def wrong_placed_digits(correct_code)
    not_equal1 = Array.new(6, 0)
    not_equal2 = Array.new(6, 0)

    (0...4).each do |i|
      if code[i] != correct_code[i]
        not_equal1[code[i] - 1] += 1
        not_equal2[correct_code[i] - 1] += 1
      end
    end

    wrong_placed = 0
    (0...6).each do |i|
      wrong_placed += [not_equal1[i], not_equal2[i]].min
    end

    wrong_placed
  end
end
