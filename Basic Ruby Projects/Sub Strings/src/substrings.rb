def substrings(text, dictionary)
    if !text.instance_of?(String) or !dictionary.instance_of?(Array) 
        return [] 
    end

    lowercase_text = text.downcase

    sub_words = {}
    dictionary.each do |word|
        unless lowercase_text.include?(word) then next end
        start = 0
        sub_words[word] = 0
        while start = lowercase_text.index(word, start) 
            sub_words[word] += 1
            start += 1
        end
    end

    return sub_words
end