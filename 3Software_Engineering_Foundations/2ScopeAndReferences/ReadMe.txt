Introduction to Sorting Algorithms
As programmers, we should choose to organize the data in a way that is useful. A common way to organize data is to sort it. For example, words of a dictionary are sorted in alphabetical order. Sorted data is valuable because it can make "looking up" entries efficient. Can you imagine searching for entries in a dictionary that isn't sorted alphabetically?!?

In this section we'll learn an algorithm to sort numbers. However, these algorithms can also be applied to sort other data like strings. An algorithm is a sequence of actions to take. We'll be using sorting algorithms as sequences of steps we can follow to organize numbers in increasing (or decreasing) order. Our goal in this section will be to take an array of numbers and modify that array so that it's elements are in increasing order.

Bubble Sort Algorithm
The Bubble Sort algorithm gets its name because it behaves as if the large numbers float to the top of the array like bubbles. See the wikipedia page on Bubble Sort and check out the visualization of how it behaves!

How does a pass of Bubble Sort work?
Before we explore Bubble Sort in nitty-gritty Ruby detail, lets visualize it conceptually! Bubble sort works by performing multiple passes to move elements closer to their final positions. A single pass will iterate through the entire array once.

A pass works by scanning the array from left to right, two adjacent elements at a time, and checking if they are ordered correctly. To be ordered correctly the first element must be less than or equal to the second. If the two elements are not ordered properly, then we swap them to correct their relative order. Afterwards, we scan the next two numbers and continue repeat this process until we have gone through the entire array.

Let's see one pass of bubble sort on the array [2, 8, 5, 2, 6]. On each step, the elements currently being scanned are in bold.

2, 8, 5, 2, 6 - ordered, so leave them alone
2, 8, 5, 2, 6 - not ordered, so swap
2, 5, 8, 2, 6 - not ordered, so swap
2, 5, 2, 8, 6 - not ordered, so swap
2, 5, 2, 6, 8 - our first pass is complete
By the end of this pass we have correctly placed 8 by "bubbling it up" to the end of the array. From this point we would continue doing passes on the array until everything is in sorted order.

How do we know when we are done Bubble Sorting?
During Bubble Sort, we can tell if the array is in sorted order by checking if we made a swap during the previous pass performed. If a swap was not performed during the previous pass, then the array must be fully sorted and we can stop the algorithm.

You're probably confused by the last statement. Recall that a pass of Bubble Sort checks if any adjacent elements are out of order and swaps them if they are. If we don't make any swaps during a pass, then everything must be in order, so our job is done. Let that sink in for a bit.

Swapping Elements
Like we saw in the previous example, Bubble Sort manipulates the array by swapping the position of two elements. To implement Bubble Sort in Ruby, we'll need to perform this operation, so let's explore it in isolation. A key detail is that we may need an extra temporary variable to store one of the elements since we will be overwriting them in the array:

array = ["a", "b", "c", "d"]    # let's swap "a" and "b"
temp = array[0];                # save a copy of the first ele
array[0] = array[1];            # overwrite the first ele with the second ele
array[1] = temp;                # overwrite the second ele with the first ele copy
p array          # => ["b", "a", "c", "d"]
It worked! But hmmm, using that temp variable was kind of messy. Is there an easier way to swap elements of an array? Yep! Ruby has many clean shortcuts:

array = ["a", "b", "c", "d"]    # let's swap "a" and "b"
array[0], array[1] = array[1], array[0]
p array         # => ["b", "a", "c", "d"]
As a side note: you can use this swapping mechanic for entire variables as well

food = "mom's spaghetti"
clothing = "sweater"

food, clothing = clothing, food

p food      # => "sweater"   
p clothing  # => "mom's spaghetti"
Bubble Sort Ruby Implementation
Using swap and our newfound understanding of Bubble Sort, let's code! Take a look at the snippet below and try to understand how it corresponds to our conceptual understanding of the algorithm. Scroll down to the commented version when you get stuck.

def bubble_sort(array)
    sorted = false
    while !sorted
        sorted = true

        (0...array.length - 1).each do |i|
            if array[i] > array[i + 1]
                array[i], array[i + 1] = array[i + 1], array[i]
                sorted = false
            end
        end
    end

    array
end
def bubble_sort(array)
    sorted = false  # when this var is false, that means the array is not fully sorted yet

    while !sorted       # while the array is not sorted...
        sorted = true       # reset the sorted flag to true 

        # the each below will perform a single 'pass' of bubble sort
        (0...array.length - 1).each do |i|
            if array[i] > array[i + 1]                              # if adjacent elements are out of order...
                array[i], array[i + 1] = array[i + 1], array[i]     #   then swap their positions
                sorted = false                                      # since we just made a swap, we may need to perform
            end                                                     # an additional 'pass', so set the flag to false
        end
    end

    array
end




Scope
If you've made it this far in the course, you've been unwittingly utilizing the concept of scope in your code. Let's take a minute explore the fundamentals of scope and define some rules! Scope describes the location in your program where a variable is accessible.

Methods and Local Scope
Let's explore lexical scope. Lexical scope describes how a variable name evaluates in nested code. In other words, how variable names resolve if we put them in structures like methods, conditionals, or blocks?

To start, let's say we had some duh-duh obvious code:

def say_hello
    message = "hello"
    p message
end

say_hello
Above we can say that the say_hello method has it's own scope where the variable message is defined. This means we are free to reference and print that variable in that same scope. The say_hello method is a local scope. This will be true for any method.

This means that if we are outside of the say_hello method/scope, we cannot reference the message variable:

def say_hello
    message = "hello"
end

say_hello
p message   # NameError: undefined local variable
The code above will fail with an error because we are referencing a variable, message, but it was not defined in that scope. We can imagine there being two scopes in that example. There is the sayHello method scope and the surrounding scope that is on the outside of sayHello.

Let's try the opposite scenario. What if we had defined a variable in the surrounding scope and tried to reference it within the say_hello scope:

message = "hi"

def say_hello
    p message   # NameError: undefined local variable
end

say_hello
Above we suffer the same issue. The say_hello scope does not have access to the surrounding scope. From our previous example it seems that a scope is determined by a method. Each method will have it's own local scope. This is going to be our rule of thumb. Technically we consider code out in the open as another local scope, although it's not a method. It's common for new ruby programmers to think that variables defined out in the open will automatically be accessible in the global scope, but this is not true.

Global Variables
Okay, so methods are the primary areas for scope, but are there any others? Everywhere area in our code can access the global scope. To define variables in the global scope, we must use special syntax. Let's redo our last example utilizing global scope:

$message = "hello globe"

def say_hello
    p $message
end

say_hello # => "hello globe"
This code will correctly print "hello globe". Creating a global variable is simple, put a $ at the beginning of the name. Here's a similar example, this time creating the global $message inside of say_hello but referencing it from the outside:

def say_hello
    $message = "hello globe"
end

say_hello
p $message # => "hello globe"
Ruby automatically defines some global variables for us to reference. For example, $PROGRAM_NAME will be a string describing the name of our program. Later in the course we'll use other global names like $stdin and $stdout handle user input and output. For now, just understand that we can reference a $variable_name anywhere in our program because it is global!

Constants
Let's take a quick detour to explore an additional way to create a variable, using a constant. A constant is denoted syntactically by beginning the name with a capital letter. By convention we like to make the entire name capital to emphasize it being a special constant.

A constant variable cannot be reassigned:

FOOD = "pho"
p FOOD # => "pho"

FOOD = "ramen"  #warning: already initialized constant FOOD
                #warning: previous definition of FOOD was here
You'll receive a warning when reassigning a constant. Reassignment means using = on that name again. A common point of confusion is that while you cannot reassign a constant, you can still mutate that constant name without warning:

FOOD = "pho"
FOOD[0] = "P"
p FOOD # => "Pho
Note that above we did not reassign to the FOOD name, instead we assign to an index of the FOOD string. The key takeaway is that constants can still mutate or be "changed", they just can't be reassigned.

Why bring up constants in our chatter about scope? Because constants will exist in global scope! We can do VARIABLE or $variable to ensure global scoping:

FOOD = "pho"
$drink = "ice coffee"

def my_favorite
    p FOOD
    p $drink
end

my_favorite
The code above works because both variables are accessible in global scope. This means they can be referenced anywhere in our code! However, we should use the global scope sparingly. We want to minimize our methods all referencing data that is outside of them, as manipulations to the data will be hard to track. Instead we should write methods that accept data as arguments as it is more explicit where the data is coming from.

What does not have it's own scope?
So methods and the global scope will be our primary structures that provide scope. Now let's highlight what structures don't have their own scope.

Blocks don't have their own scope, they are really a part of the containing method's scope. Below, the times block can reference message.

def say_bye
    message = "bye"

    3.times do 
        p message
    end
end

say_bye
Other structures like conditionals or while loops also don't have their own scope, they are really part of the containing scope. Although a variable is defined within the if statement below, it is still accessible outside of the if statement, because if's don't have their own scope.

if true
    drink = "cortado"
end

p drink