Printing
There are a few ways to "print" output to the screen in Ruby. We have been using puts frequently in this course, but you can also use print and p. So many options! However, each method has some unique behavior. Let's step through them.

print
print is the simplest method used to print data. It will do minimal formatting and not even add a new line at the end of the print:

print "hello"
print "world"

# the code above would print:
# helloworld
To manually add a new line you can use the character "\n". "\n" stands for "new line." This syntax is often used for other whitespace characters like tab ("\t").

print "hello\n"
print "\tworld\n"

# the code above would print:
# hello
#   world
puts
puts also prints data to the screen, but with some formatting, including adding an automatic new line after every puts:

puts "hello"
puts "world"

# the code above would print:
# hello
# world
p
p prints data to the screen with a new line but also gives information on type of data was printed:

p "hello"
p 'goodbye'
p "42"
p 42

# the code above would print:
# "hello"
# "goodbye"
# "42"
# 42
Lets notice a few things above:

it doesn't matter if we wrap a string in double quotes or single quotes, it is still a string (in a later course we'll learn a slight distinction between the two).
we are able to differentiate the string "42" from the number 42 because the p method will actually print out the quotes that wrap the string data. Very cool!


.length (Hello.length would be 5, but in order to get the index you would just do -1 since 0 counts as a number for indexes)
[]
+

str.length
i = 0
puts str[i]

This would pring the first index of the string or "s"
if I then decide to increment through the string i could make it print eeach index one at a time

str = string
i = 0
if i < string.length
    puts string[i]
    i += 1
end

another way to execute this is the following way to allow any word

def printChar(str)
    i = 0
    while i < str.length
        puts str[i]
        i += 1
    end
end

printChar("cats")

c
a
t
s

would be the output