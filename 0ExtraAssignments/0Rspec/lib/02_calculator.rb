def add(a, b) #This creates 2 variables parameter that add the a and b value together
    a += b  #A different approach i could take is. result = a += b. then follow with a p/print/puts/return of result
end

def subtract(a, b) #Same as above but using subtraction instead of addition
    a -= b
end

def sum(array) # gets the sum by adding all of the numbers within the array together
    array.inject(0) { |result, number| number + result } #by inject goes through all elements of the array and contains 2 params, number and result, initial value of result passed as param to inject(0) while number is the value being added to with each iteration.
end

# it should show that add subtract and sum all function properly