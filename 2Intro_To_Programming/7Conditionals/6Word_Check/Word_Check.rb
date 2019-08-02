def word_check(word)
	if word.length > 6
      return "Long"
    elsif word.length == 6
      return "Medium"
    elsif word.length < 6
      return "Short"
    end
end

puts word_check("contraption") # => "long"
puts word_check("fruit")       # => "short"
puts word_check("puzzle")      # => "medium"