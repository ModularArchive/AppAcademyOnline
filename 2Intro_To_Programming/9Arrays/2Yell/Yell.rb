def yell(words)
	narray = []
  	i = 0
  	while i < words.length
      	narray << words[i] += "!"
      	i +=1
    end
  	return narray
end

print yell(["hello", "world"]) # => ["hello!", "world!"]
puts
print yell(["code", "is", "cool"]) # => ["code!", "is!", "cool!"]