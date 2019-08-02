def factorial(num)
	factor = 1
  	while num > 0
      	factor *= num
      	num -= 1
    end
  	return factor
end

puts factorial(3) # => 6, because 1 * 2 * 3 = 6
puts factorial(5) # => 120, because 1 * 2 * 3 * 4 * 5 = 120