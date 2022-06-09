def caesar_cipher!(text, shift, default_result = nil)
    if !text.instance_of?(String) 
        return default_result
    elsif !shift.instance_of?(Integer)
        return text
    end

    shift %= 26
    return text = (text.chars.map do |c|
        ascii_value = c.ord
        if ascii_value.between?("a".ord, "z".ord)
            ((ascii_value - "a".ord + shift) % 26 + "a".ord).chr
        elsif ascii_value.between?("A".ord, "Z".ord)
            ((ascii_value - "A".ord + shift) % 26 + "A".ord).chr
        else
            c
        end
    end).join
end 

def caesar_cipher(text, shift, default_result = nil)
    return caesar_cipher!(String.new(text), shift, default_result)
end 