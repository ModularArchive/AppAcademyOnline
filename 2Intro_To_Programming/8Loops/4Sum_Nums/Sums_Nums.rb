def sum_nums(max)
	num = 0
  	while max >= 0
		num += max
      	max -= 1
    end
  	return num
end

puts sum_nums(4) # => 10, because 1 + 2 + 3 + 4 = 10
puts sum_nums(5) # => 15