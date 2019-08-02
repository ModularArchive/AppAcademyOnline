def is_palindrome(word)
	i = word.length - 1
  	rword = ""
  	while i >= 0
      	rword += word[i]
      	i -= 1
    end
	if rword == word
    	return true
    else
      	return false
    end
end

puts is_palindrome("racecar")  # => true
puts is_palindrome("kayak")    # => true
puts is_palindrome("bootcamp") # => false