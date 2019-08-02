def reverse(word)
	i = word.length - 1
  	rword = ""
  	while i >= 0
      	rword += word[i]
      	i -= 1
    end
	return rword
end

puts reverse("cat")          # => "tac"
puts reverse("programming")  # => "gnimmargorp"
puts reverse("bootcamp")     # => "pmactoob"