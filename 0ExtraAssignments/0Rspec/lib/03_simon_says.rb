def echo(string)#blank variable to enter a string
    string    # produces the string variable string
end

def shout(string) #blank variable to enter a string
    string.upcase #Turns all letters within string to uppercase
end

def repeat(string,r=2)    #default value repeat 2 times
    ((string + ' ') * r).strip  #The string + a space " " creates a gap between strings, then multiplies by r(or 2 by default), then .strip removes any null or white spaces at the beginning/end of the string
end

def start_of_word(string, index) #grabs starting index of string
    string[0..(index-1)]    # cycling through a range of numbers up to the last index (we need -1 from the index because we're counting 0 as a number)
end

def first_word(string)
    string.split[0] #takes the first word from string using split and targeting the first index within the string
end

def titleize(string)
    little_string = %w{the over and} #an array of strings separated by spaces instead of strings, highlights what needs to be lowercase
    string.capitalize!  #capitalize the rest
    string.gsub(/\w+(\Z|\s)/) { |string| little_string.include?(string.strip) ? string : string.capitalize } #gsub allows the second arguement to replace the first, thereby replacing the little words, and simultaneously capitalizing the other words, then stripping any extra spaces that may be there
end

