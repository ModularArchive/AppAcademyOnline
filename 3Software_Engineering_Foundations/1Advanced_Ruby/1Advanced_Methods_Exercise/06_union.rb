# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.
def union(*array)
    array.inject { |acc, arr| acc + arr } #accumulator + array
end
# acc starts by targeting the first chunk of arrays "x", "y"
# arr targets the second group of arrays true, false
# concatenate combines them into the same array
# arr targets the next group of arrays 20, 21, 23
# concatenate combines the remaining arrays together

p union(["a", "b"], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
p union(["x", "y"], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]
