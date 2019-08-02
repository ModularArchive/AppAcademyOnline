a good exmaple of how to increment between ranges without using the range feature is

def printNums(min, max)
    i = min
    while i <= max
        puts i

        i += 1

    end

end

printNums(1, 4)

This would print out 1, 2, 3, 4


break & next

i = 1
while i <= 10
    puts i
    if i == 5
        break
    end
    puts i
    i += 1
end

this would iterate 1-4 twice each
next when it reaches 5 it would print 5 then break and end the code
break exits the code

i = 1
while i <= 10
    puts i
    if i == 5
        next
    end
    puts i
    i += 1
end

this creates an infinite loop that prints 5, so what happens is it iterates and prints 1-4 twice
but upon reaching 5 the next statement skips onto the next line of code, which means you skip over
the incrementation and straight back to is i <= 10 print i, which in this case would be 5
to properly increment past 5 and avoid an infinite loop we will code it the following way
i = 1
while i <= 10
    puts i
    if i == 5
        i += 1
        next
    end
    puts i
    i += 1
end
