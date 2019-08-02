def translate(string)
    string = string.split #Automatically splits the string
    result = [] #Turns result into array
    string.each {|string| result << translated_string(string)} #shovels the translated_string into result
    result.join(' ') # Joins the arrays by the spaces 
end

def translated_string(string)
    vowels = %w{a e i o u} #created an array separated by spaces with a e i o u
    return string + 'ay' if vowels.include?(string[0].downcase)
    beginning = ''
    capitalizing = string[0].between?('A', 'Z')
    string.downcase!
    while true #if include? is true
        break if vowels.include?(string[0]) && !(beginning[-1]=='q' && string[0] == 'u') #counts Q and U as a single phenom
        beginning << string.slice!(0)
    end
    string << beginning + 'ay'
    capitalizing ? string.capitalize : string
end

# A different approach I decided to abandon after learning about .slice and .include?

#        if string[0] == "a" || "A" || "e" || "E" || "i" || "I" || "o" || "O" || "u" || "U"
#            string[-1] << "ay"
#            i = 0
#            while i <= string.length
