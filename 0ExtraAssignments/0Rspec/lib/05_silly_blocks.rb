def reverser
    yield.gsub!(/\w+/) {|word| word.reverse} #Substitute the first arguement with the second, to word, reverse the string
end

def adder(add=1)
    yield + add #default value of 1 as the addition
end
def repeater(repeat=1)#default value of 1 in number of times repeated
    repeat.times {yield}
end
