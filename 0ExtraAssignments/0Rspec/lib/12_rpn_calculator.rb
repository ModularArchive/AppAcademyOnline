class RPNCalculator

    def initialize
        @arr = [] #I'll be using @ to create instance variables so they function throughout the class rather than just within the current block
        @value = nil #Give @value nil (no value) as a starting point to create the variable
    end

    def value
        @value
    end

    def push(value)
        @arr << value 
    end

    def plus 
        raise "calculator is empty" if @arr.length < 2 #checks to make sure @arr has 2 or more values, if not it raises "calculator is empty",
        @value = @arr.pop + @arr.pop #simple concatination for adding the values together
        @arr << @value #shovel from @value to @arr
    end

    def minus
        raise "calculator is empty" if @arr.length < 2
        @value = - @arr.pop + @arr.pop #Same as above however with a - implemented at the beginning so the added numbers will subtract
        @arr << @value
    end

    def divide
        raise "calculator is empty" if @arr.length < 2
        @value = 1.0 / @arr.pop * @arr.pop #same as before but using division with .0 to allow for fractions
        @arr << @value
    end

    def times
        raise "calculator is empty" if @arr.length < 2
        @value = @arr.pop * @arr.pop # as above but with multiplication
        @arr << @value
    end

end