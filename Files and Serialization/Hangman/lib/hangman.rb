# frozen_string_literal: true

require_relative 'random_word'
require_relative 'hangman_state'
require 'json'

module Hangman
  def self.valid_guess?(guess)
    ('a'..'z').include?(guess)
  end

  def self.show_guessed_letters(guessed_letters)
    puts "Letters guessed: #{guessed_letters.join(', ')}" if guessed_letters.length.positive?
  end

  def self.correct_guess?(word, guessed_letters)
    word.each_char do |letter|
      return false unless guessed_letters.include?(letter)
    end

    true
  end

  def self.guess_input
    print 'Enter your guess(or type save to save current state): '
    gets.chomp.downcase
  end

  def self.enter_guess(guessed_letters)
    show_guessed_letters(guessed_letters)
    guess = guess_input

    if guess.eql?('save')
      return 'save'
    elsif guessed_letters.include?(guess)
      puts 'You\'ve already guessed that letter!! Enter again.'
    elsif valid_guess?(guess)
      guessed_letters << guess
      return guess
    else
      puts 'Invalid guess!! Enter again.'
    end

    enter_guess(guessed_letters)
  end

  def self.attempts_left(word, guessed_letters)
    10 - guessed_letters.reduce(0) do |wrong, letter|
      wrong += 1 unless word.include?(letter)
      wrong
    end
  end

  # too long method
  def self.play(word, guessed_letters = [])
    attempts_left = attempts_left(word, guessed_letters)
    while attempts_left.positive?
      puts "\n#{attempts_left}. attempts left:"
      guess = enter_guess(guessed_letters)

      if guess.eql?('save')
        HangmanState.save(word, guessed_letters)
        return
      elsif word.include?(guess)
        puts 'Correct guess.'
      else
        attempts_left -= 1
        puts 'Incorrect guess.'
      end

      puts word.masked(guessed_letters)

      if correct_guess?(word, guessed_letters)
        puts "You've guessed word."
        return 
      end
    end

    puts "You couldn't guess the word #{word}. :("
  end

  # ask to continue old game, or start a new one
  def self.new_or_load
    puts 'Select:', '1) New game', '2) Load game'

    user_input = gets.chomp
    case user_input
    when '1' then 1
    when '2' then 2
    else
      puts "Wrong input, try again.\n\n"
      new_or_load
    end
  end

  def self.run
    if new_or_load.eql?(1)
      play(RandomWord.new)
    else
      game_state = HangmanState.load
      play(RandomWord.new(game_state[:word]), game_state[:guessed_letters])
    end
  end
end
