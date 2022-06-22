# frozen_string_literal: true

class RandomWord < String
  DICTIONARY = File.readlines('dictionary.txt', chomp: true).freeze

  def self.pick_word
    DICTIONARY[Random.rand(DICTIONARY.length)]
  end

  def initialize(string = RandomWord.pick_word)
    replace(string)
  end

  def masked(guessed_letters)
    (chars.map do |letter|
      if guessed_letters.include?(letter)
        letter
      else
        '_'
      end
    end).join('')
  end
end
