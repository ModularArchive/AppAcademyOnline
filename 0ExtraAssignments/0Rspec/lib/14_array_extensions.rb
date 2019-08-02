class Array
    def sum #Result; numbers in array added together
        self.empty? ? 0 : self.inject(:+) #.empty? checks for any enumeral and returns a true or false statement based on if that's tru
    end

    def square #Squaring the values and creating a new array
        self.collect {|x| x * x} #collect invokes block once for each element of self.
    end

    def square!
        self.replace self.square #Squares the elements of the original array using replace
    end
end