def count_vowels(word)
	i = 0
  	num = 0
  	while i < word.length
    	if word[i] == "a" || word[i] == "e" || word[i] == "i" || word[i] == "o" || word[i] == "u"
			num += 1
        end
    	i += 1
    end
  	return num
end
#Since word[i] is being used in more than one place as a reference it should be turned into a variable
puts count_vowels("bootcamp")  # => 3
puts count_vowels("apple")     # => 2
puts count_vowels("pizza")     # => 2