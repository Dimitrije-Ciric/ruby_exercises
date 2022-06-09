def substrings(text, dictionary, default_result = [])
    if !text.instance_of?(String) or !dictionary.instance_of?(Array) 
        return default_result
    end

    lowercase_text = text.downcase

    sub_words = Hash.new(0)
    dictionary.each do |word|
        lowercase_word = word.downcase
        next if sub_words[lowercase_word] > 0 # if same word occurred before => skip
        start = 0
        while start = lowercase_text.index(lowercase_word, start) 
            sub_words[lowercase_word] += 1
            start += 1
        end
    end

    return sub_words
end
