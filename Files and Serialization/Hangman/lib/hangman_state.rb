# frozen_string_literal: true

module HangmanState
  SAVE_DIR = '../save/'

  def HangmanState.invalid_letters
    puts 'Name you entered contains invalid letters. Try again.'
  end

  def HangmanState.save(word, guessed_letters)
    print 'Enter name of this game: '
    file_path = "#{SAVE_DIR}#{file_name = gets.chomp}.json"

    if File.exist?(file_path)
      puts "There is already saved game with #{file_name}. Try again."
    else
      begin
        File.open(file_path, 'w') do |file|
          file.write(JSON.dump({
            word: word,
            guessed_letters: guessed_letters
          }))
        end
        return
      rescue StandardError
        invalid_letters
      end
    end

    save(word, guessed_letters) # try again
  end

  def HangmanState.available
    puts 'Available saves:'
    names = Dir.entries(SAVE_DIR).reject { |name| %(. ..).include?(name) }
    puts names.map { |name| name[0, name.length - 5] }
  end

  def HangmanState.load
    available
    print 'Enter name of saved game: '
    file_path = "#{SAVE_DIR}#{file_name = gets.chomp}.json"

    if File.exist?(file_path)
      begin
        JSON.parse(File.read(file_path), { symbolize_names: true })
      rescue StandardError
        invalid_letters
        load
      end
    else
      puts "There is no saved game with #{file_name}. Try again."
      load
    end
  end
end
