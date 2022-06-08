def substrings(text, dictionary)
    if !text.instance_of?(String) or !dictionary.instance_of?(Array) 
        return [] 
    end

    lowercase_text = text.downcase

    sub_words = {}
    dictionary.each do |word|
        next unless lowercase_text.include?(word)
        next if sub_words[word] # if same word occurred before => skip
        lowercase_word = word.downcase
        start = 0
        sub_words[lowercase_word] = 0
        while start = lowercase_text.index(lowercase_word, start) 
            sub_words[lowercase_word] += 1
            start += 1
        end
    end

    return sub_words
end
