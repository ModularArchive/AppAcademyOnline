def doubler(numbers)
	earray = []
  	i = 0
  	while i < numbers.length
      	earray << numbers[i] * 2
      	i += 1
    end
  	return earray
end

print doubler([1, 2, 3, 4]) # => [2, 4, 6, 8]
puts
print doubler([7, 1, 8])    # => [14, 2, 16]