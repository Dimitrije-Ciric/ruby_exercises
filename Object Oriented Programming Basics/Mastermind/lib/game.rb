# frozen_string_literal: true

require_relative 'code'

module Game
  def self.show_menu
    puts 'Choose what you want:'
    puts "\tbreak code - 1"
    puts "\tmake code - 2"
    puts "\thelp - 3"
    puts "\texit - 0"
  end

  def self.help
    # shows manual for game
  end

  def self.user_code
    print 'Enter your code combination: '
    code = Code.new(gets.chomp)

    if code.length != 4
      puts 'The code you entered doesn\'t have 4 digits. Try again.'
    elsif !code.valid_digits?
      puts 'The code you entered is invalid. Try using only valid digits.'
    else
      return code
    end

    user_code # enter again
  end

  def self.correct_guess?(guess, code)
    puts
    if guess == code
      puts 'Code is correct!'
      return true
    end

    puts 'Bad guess!'
    correct_digits = guess.correct_placed_digits(code)
    wrong_placed_digits = guess.wrong_placed_digits(code)
    puts "#{correct_digits} digits are placed correctly."
    puts "#{wrong_placed_digits} digits are placed wrong."

    false
  end

  def self.challenge_user(code)
    puts 'Now you have 12 tries to guess the code.'
    1.upto(12) do |try_idx|
      if try_idx == 12
        puts "\nThis is your last chance, be careful."
      else
        puts "\n#{try_idx}. try"
      end

      break if correct_guess?(user_code, code)
      
      puts "\nYou lost. Secret code is #{code}." if try_idx == 12
    end
  end

  def self.break_code(user_code)
    1.upto(12) do |try_idx|
      puts "\nThis is my last chance, I must be careful." if try_idx == 12

      try = Code.new
      puts "\nMy #{try_idx}. try: #{try}"

      break if correct_guess?(try, user_code)

      puts "\nI lost :(" if try_idx == 12
    end
  end

  # returns false when user request to exit from game
  def self.user_input
    case gets.chomp
    when '0' # exit from game
      return false
    when '1' # break code
      puts
      puts '4 digit secret code is generated.'
      challenge_user(Code.new)
    when '2'
      puts
      break_code(user_code)
    when '3' # help
      help
    else
      'You entered wrong number! Try again.'
    end

    true
  end

  def self.menu
    exit = false
    until exit
      puts
      show_menu
      exit = true unless user_input
    end
  end
end
