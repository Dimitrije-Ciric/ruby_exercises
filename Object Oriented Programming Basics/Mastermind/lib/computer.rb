# frozen_string_literal: true

class Computer
  def initialize
    menu
  end

  private

  def show_menu
    puts 'Choose what you want:'
    puts "\tbreak code - 1"
    puts "\tmake code - 2"
    puts "\thelp - 3"
    puts "\texit - 0"
  end

  def help 
    # shows manual for game
  end

  def generate_code
    code = Array.new(4) { Random.rand(6) + 1 }
    puts "4 digit secret code is generated."

    return code
  end

  def user_code
    loop do
      print 'Enter your code combination: '
      code = gets.chomp.split('').reject { |element| element.eql?(' ') }
      code.map! { |element| element.to_i }

      if code.length != 4
        puts 'The code you entered doesn\'t have 4 digits. Try again.'
      elsif code.any? { |digit| !digit.to_i.between?(1, 6) }
        # invalid input, user guess code contains invalid digits
        puts 'The code you entered is invalid. Try using only valid digits.'
      else
        return code
      end
    end
  end

  def correct_placed_digits(guess, code)
    # guess and code objects will be changed, you should pass duplicated code
    correct_digits = 0
    3.downto(0) do |idx|      
      if guess[idx].eql?(code[idx])
        correct_digits += 1
        code.delete_at(idx)
        guess.delete_at(idx)
      end
    end

    correct_digits
  end

  def wrong_placed_digits(guess, code)
    # guess and code objects will be changed, you should pass duplicated code
    wrong_placed_digits = 0
    guess.each do |digit|      
      if code.include?(digit)
        wrong_placed_digits += 1
        code.delete_at(code.index(digit))
      end
    end

    wrong_placed_digits
  end

  def correct_guess?(guess, code) 
    # guess and code objects will be changed, you should pass duplicated code
    puts
    if guess.eql?(code) 
      puts 'Code is correct!'
      return true
    end
      
    puts 'Bad guess!'
    correct_digits = correct_placed_digits(guess, code)
    wrong_placed_digits = wrong_placed_digits(guess, code)
    puts "#{correct_digits} digits are placed correctly."
    puts "#{wrong_placed_digits} digits are placed wrong."

    false
  end

  def challenge_user(code)
    puts 'Now you have 12 tries to guess the code.'
    1.upto(12) do |try_idx|
      if try_idx.eql?(12) 
        puts "\nThis is your last chance, be careful."
      else
        puts "\n#{try_idx}. try"
      end

      return if correct_guess?(user_code, code.dup)
    end

    puts "\nYou lost. Secret code is #{code.reduce('') { |code_s, digit| code_s + digit.to_s}}."
  end

  def break_code(user_code)
    1.upto(12) do |try_idx|
      if try_idx.eql?(12) 
        puts "\nThis is my last chance, I must be careful."
        next
      end
      try = Array.new(4) { Random.rand(6) + 1 }

      puts "\nMy #{try_idx}. try: #{try.reduce('') { |code_s, digit| code_s + digit.to_s}}"
      return if correct_guess?(try, user_code.dup)
    end

    puts "\nI lost :("
  end

  # returns false when user request to exit from game
  def user_input
    case gets.chomp
    when '0' # exit from game
      return false
    when '1' # break code
      puts
      challenge_user(generate_code)
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

  public

  def menu
    exit = false
    until exit
      puts
      show_menu
      exit = true unless user_input
    end
  end
end
