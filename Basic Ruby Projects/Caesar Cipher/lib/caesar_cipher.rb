# frozen_string_literal: true

def caesar_cipher!(text, shift)
  shift %= 26
  text = (text.chars.map do |c|
    ascii_value = c.ord
    if ascii_value.between?('a'.ord, 'z'.ord)
      ((ascii_value - 'a'.ord + shift) % 26 + 'a'.ord).chr
    elsif ascii_value.between?('A'.ord, 'Z'.ord)
      ((ascii_value - 'A'.ord + shift) % 26 + 'A'.ord).chr
    else
      c
    end
  end).join
end

def caesar_cipher(text, shift)
  caesar_cipher!(text.dup, shift)
end
