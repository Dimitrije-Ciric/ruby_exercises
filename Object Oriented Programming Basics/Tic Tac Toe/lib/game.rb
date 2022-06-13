# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# tic tac toe game class
class Game
  begin
    # try load Tic Tac Toe sign
    SIGN = File.read('sign.txt').freeze
  rescue StandardError
    SIGN = 'Tic Tac Toe'
  end

  def self.name_input(reserved_name = '')
    loop do
      print 'Enter your name: '
      name = gets.chomp

      if name.length.between?(3, 20)
        return name unless name.eql?(reserved_name)

        puts 'Players must have different names'
      else
        puts 'Name must have from 3 to 20 characters!'
      end
    end
  end

  def self.symbol_input(reserved_symbol = '')
    loop do
      print 'Enter your 1 character symbol: '
      symbol = gets.chomp

      if symbol.length.eql?(1)
        return symbol unless symbol.eql?(reserved_symbol)

        puts 'Players must have different symbols'
      else
        puts 'Symbol must have only 1 character'
      end
    end
  end

  def self.turn(player, board)
    loop do
      puts
      puts board
      print "(#{player.name}) Choose number to place symbol: "
      cell_number = gets.to_i
      break if board.place(cell_number, player.symbol)

      puts 'Number you selected is invalid!'
    end
  end

  def self.score(player1, player2)
    max_name_length = [player1.name.length, player2.name.length].max
    max_score_length = [player1.score.to_s.length, player2.score.to_s.length].max
    print '┌', '─' * max_name_length, '┬', '─' * max_score_length, "┐\n"
    print "│#{player1.name}#{' ' * (max_name_length - player1.name.length)}│#{player1.score}│\n"
    print '├', '─' * max_name_length, '┼', '─' * max_score_length, "┤\n"
    print "│#{player2.name}#{' ' * (max_name_length - player2.name.length)}│#{player2.score}│\n"
    print '└', '─' * max_name_length, '┴', '─' * max_score_length, "┘\n"
  end

  def self.single_game(player_starts, player1, player2)
    board = Board.new
    current_player = player_starts
    loop do
      turn(current_player, board) # play single turn

      if board.win?
        puts board, "\n#{current_player.name} won!"
        current_player.score += 1
        break
      elsif board.full?
        puts board, 'Tie!'
        break
      end

      current_player = (current_player.eql?(player1) ? player2 : player1)
    end

    repeat_game(player_starts, player1, player2)
  end

  def self.repeat_game(player_starts, player1, player2)
    puts score(player1, player2)

    print 'Do you want to play new game(Y/N)? '
    unless gets[0].upcase.eql?('Y')
      puts "\n\nExiting... :("
      return
    end
    puts "\n\nNew game began! :)"

    single_game((player_starts.eql?(player1) ? player2 : player1), player1, player2)
  end

  private_class_method :name_input, :symbol_input, :turn, :score, :single_game, :repeat_game

  def self.run
    puts SIGN # displays Tic Tac Toe sign
    puts

    # creates players
    puts 'Player 1'
    player1 = Player.new(name_input, symbol_input)
    puts "\nPlayer 2"
    player2 = Player.new(name_input(player1.name), symbol_input(player1.symbol))

    single_game(player1, player1, player2) # plays single game
  end
end
