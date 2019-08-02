# Write a method, `only_vowels?(str)`, that accepts a string as an arg.
# The method should return true if the string contains only vowels.
# The method should return false otherwise.

def only_vowels?(str)
    vowels = "aeiou"
    str.split("").all? { |char| vowels.include?(char) } # the all? method is inapplicaable to strings so I needed to split the string into an array
end #when using .all I applied the all to the string and not the vowels, I didn't want to check every single vowel is in the string, instead that everything in the string is a vowel
p only_vowels?("aaoeee")  # => true
p only_vowels?("iou")     # => true
p only_vowels?("cat")     # => false
p only_vowels?("over")    # => false


