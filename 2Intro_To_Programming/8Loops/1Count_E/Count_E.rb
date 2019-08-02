def count_e(word)
    i = 0
    num = 0
    while i < word.length
        if word[i] == "e"
            num += 1
        end
        i += 1
    end
    return num
end

puts count_e("movie") # => 1
puts count_e("excellent") # => 3