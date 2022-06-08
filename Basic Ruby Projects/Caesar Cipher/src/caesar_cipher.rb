def caesar_cipher!(text, shift, default_result = nil)
    if !text.instance_of?(String) 
        return default_result
    elsif !shift.kind_of?(Integer)
        return text
    end

    shift %= 26
    idx = 0
    text.each_char do |c|
        ascii_value = c.ord
        if ascii_value >= "a".ord && ascii_value <= "z".ord
            text[idx] = ((ascii_value - "a".ord + shift) % 26 + "a".ord).chr
        elsif ascii_value >= "A".to_s.ord && ascii_value <= "Z".to_s.ord 
            text[idx] = ((ascii_value - "A".ord + shift) % 26 + "A".ord).chr
        else
            text[idx] = c
        end
        idx += 1
    end
    return text
end 

def caesar_cipher(text, shift, default_result = nil)
    result = caesar_cipher!(String.new(text), shift, default_result)
    print result
    return result
end 