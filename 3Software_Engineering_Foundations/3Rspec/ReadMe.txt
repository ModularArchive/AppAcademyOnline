Introduction to Testing
As a programmer, your job is to write code that is robust and bug-free. So far throughout the course we have tested our functions for correctness by calling them and printing out the results. Testing is important because it allows us to verify our code. Later in this topic, we'll explore RSPEC to automate tests, but for now let's simply focus on what it means to be test driven.

What is TDD?
TDD (Test Driven Development) is a strategy to develop programs where the requirements for the program are turned into test cases. Changes to program are made until the program passes the test cases. Here is a high level overview of a basic TDD workflow to create a method:

Write a new test
Run all tests & check for fail
The new test should fail. If it passes, it should be rewritten
Make changes to the method to satisfy the tests
Run all tests & check for pass
if any tests fail, go to back step 3
if all tests pass, but more test coverage is needed, go to step 1
Once we complete all 4 steps, we have completed 1 iteration of TDD.

In the course thus far, method problems usually come with examples of how the method should behave. These are examples of simple test cases.

TDD workflow with prime?
Time to explore a TDD workflow for developing our classic prime? implementation:

Write a method `prime?(n)` that takes in a number and returns a
boolean indicating whether or not the number is a prime.
A prime number is a number only divisible by two numbers, 1 and itself.
Bear in mind that the point of TDD is write code methodically and test thoroughly. One iteration of the TDD cycle will work to add one "feature" to our method. We will keep making iterations until our prime? has complete coverage of all scenarios we can give it. Let's go in-depth through the first TDD iteration of prime?. We begin with an empty method definition. Surely this will fail any test cases:

def prime?(num)

end
Iteration 1: Write a new test
Let's add our first test. The test below will check if the method is correctly able to identify numbers that are not prime. Notice that the desired output is only about a single requirement for the method. There are multiple example cases, but they all test the same fact: "the method should return false when the number is not prime"

# TDD Iteration 1: return false if the number is not prime

# new test
prime?(6) # => false
prime?(8) # => false
prime?(9) # => false
Iteration 1: Run All Tests and Check for New Failure
Now that we have added a test, we should run the test to verify that it fails. This step seems trivial but it is very important. If we have followed a true TDD cycle thus far, the test will almost certainly fail as we have not yet implemented code to support the test. However, we cannot assume. We need to know that the test can fail, otherwise it may not be testing anything at all. Imagine the scenario where we unknowingly wrote a broken test that always passes. If we don't have the expectation that the test should fail as soon as we add it, we will unwittingly add the broken test to our test suite. The bad test will give us false sense of security and this can be very deadly. Because false positives can be costly, let's take a moment to verify that our new test fails.

# TDD Iteration 1: return false if the number is not prime

def prime?(num)

end

# desired output
prime?(6) # => false
prime?(8) # => false
prime?(9) # => false

# current output
prime?(6) # => nil (FAIL)
prime?(8) # => nil (FAIL)
prime?(9) # => nil (FAIL)
Wooo! Look at all of those fails. This is what we want. TDD itself is driven by failure. This seems counterintuitive, but this is what makes TDD so thorough! A test is only valuable if it has more than 1 outcome. Now we know that the test has a possible failure outcome and we can proceed.

Iteration 1: Make changes to the method
Now it's time to code! Our goal is to change the method so that it satisfies the failing test. Now we run into another key principle of TDD. We should only make changes to the method that will support the test. We should not add any extra functionality. At this stage, we want to write a minimal amount of logic that will allow us to pass the test. This will help keep our code simple and avoid over-engineering. Even if we anticipate further functionality requirements, we should save implementing it until we reach another iteration of the TDD cycle.

So let's be methodical and write code to support the test at hand. That is, we need to implement the logic to check if a number is not prime.

# TDD Iteration 1: return false if the number is not prime

def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end
end
Iteration 1: Run All Tests
Now it's time to see if the changes have met the requirements. At this point, we should run all test, even those from previous TDD iterations. It is important to run all tests to verify that the changes we made did not break any existing functionality. If any tests fail, we should go back to the last stage and debug. If all tests pass we can continue.

# TDD Iteration 1: return false if the number is not prime

def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end
end

# desired output
prime?(6) # => false
prime?(8) # => false
prime?(9) # => false

# current output
prime?(6) # => false (PASS)
prime?(8) # => false (PASS)
prime?(9) # => false (PASS)
Nice! We are passing all of the tests. At this point we can consider adding more tests to the method. Although our current implementation of prime? is passing all tests, it lacks complete coverage. Can you think of any scenarios where our current prime? will not work? Let's do additional iterations of TDD to fix these!

Iteration 2: Write a New Test
We need more coverage to make sure our prime? can handle prime numbers correctly.

# TDD Iteration 2: return true if the number is prime

prime?(2)   # => true
prime?(7)   # => true
prime?(11)  # => true
Iteration 2: Run All Tests and Check for New Failure
# TDD Iteration 2: return true if the number is prime

def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end
end

# desired output
prime?(2)   # => true
prime?(7)   # => true
prime?(11)  # => true

# current output
prime?(2)   # => 2...2 (FAIL)
prime?(7)   # => 2...7 (FAIL)
prime?(11)  # => 2...11 (FAIL)
Iteration 2: Make changes to the method
# TDD Iteration 2: return true if the number is prime

def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end

  true
end
Iteration 2: Run All Tests and Check for Pass
# TDD Iteration 2: return true if the number is prime

def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end

  true
end

# desired output
prime?(2)   # => true
prime?(7)   # => true
prime?(11)  # => true

# current output
prime?(2)   # => true (PASS)
prime?(7)   # => true (PASS)
prime?(11)  # => true (PASS)
Iteration 3: Write a new Test
We need more coverage to make sure our prime? can handle numbers less than 2 properly.

# TDD Iteration 3: return false if the number is less than 2, since 2 is the smallest prime

prime?(1)   # => false
prime?(0)   # => false
prime?(-42) # => false
Iteration 3: Run All Tests and Check for Failure
# TDD Iteration 3: return false if the number is less than 2, since 2 is the smallest prime

def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end

  true
end

# desired output
prime?(1)   # => false
prime?(0)   # => false
prime?(-42) # => false

# current output
prime?(1)   # => true (FAIL)
prime?(0)   # => true (FAIL)
prime?(-42) # => true (FAIL)
Iteration 3: Make Changes to the Method
def prime?(num)
  return false if num < 2

  (2...num).each do |i|
    return false if num % i == 0
  end

  true
end
Iteration 3: Run All Tests and Check for Pass
def prime?(num)
  return false if num < 2

  (2...num).each do |i|
    return false if num % i == 0
  end

  true
end

# desired output
prime?(1)   # => false
prime?(0)   # => false
prime?(-42) # => false

# current output
prime?(1)   # => false
prime?(0)   # => false
prime?(-42) # => false
We have completed 3 TDD iterations on prime? and we are done! Note that we did not show the previous tests on every iteration to keep things clean in our illustrations. However, you should run both the previous and new tests whenever testing the method. This ensures that any new code you write does not break any previous functionality.

When Should We Use TDD?
TDD is a popular development strategy to employ in the professional world. From our walkthrough of test-driven prime?, you can definitely see how methodical the process is. Adding one feature and one test at a time is indeed painstaking and tedious at times. If you are chomping at the bit to complete a method (like when you are facing a deadline) you will probably diverge from the TDD process and not follow it as strictly. However, you should follow it as best you can to be thorough!

You don't have to employ a true TDD workflow at this point in your programming careers, however you should at least have it in mind. The big picture idea to take away from this lesson is that you should think how a method should behave before writing it. If you are designing a method, you should think of example method calls for yourself. If you understand how the method should behave, then you have a clear goal in mind and the code you write should bring you closer to this goal.

When writing an example call about how a method should behave, we note its input (arguments) and output (return value). Designing an example call is like plotting start and end points on a map. After we have established the start and end, we can then choose the turns to take in the hope of reaching the end point.

Next we'll learn about RSPEC, a tool we can use to automate our testing and speed up the development process!



Introduction to RSpec Testing
Why do we use automated testing?
Currently, we manually test our code. For example, we create our own test cases by printing and checking the output of our functions. This can be tedious, repetitive, and worst of all, it is a method vulnerable to both false positives and false negatives. The larger your code base is, the more chances there are for both of these to occur. Because of this, relying on manual testing alone is not a sustainable solution when you start working on larger code projects written by multiple people.

Enter automated testing.

What is automated testing?
When using automated testing, developers will code test suites, a collection of test cases that are intended to show that a program demonstrates some specified set of behaviours. There are many libraries dedicated to doing this, with the most popular one for Ruby being RSpec.

Though we spend more time upfront writing and updating code for our test suite, the advantage is that we can instantly and easily test that code at any time from then on, in a way that will be simpler and more robust than doing it manually.

Foundations and testing
Testing is a huge topic that we'll more fully introduce during the main course, but as we saw in the last section, the core concept is simple: the tests sets up some expectation of behavior and then checks that your code meets that expectation. For now, our goal is to be able to interpret tests and understanding the basics of RSpec, not necessarily write tests in RSpec. The upcoming projects in this course utilize automated testing via RSpec, so the ability to read tests will be invaluable!

Anatomy of an RSpec project
To use RSpec, we'll need to structure our project files in a certain way. We separate our implementation code files from the testing files using a /lib and /spec folder respectively. Another word for a "test" is a "spec" (short for specification, since the tests specify how our code should behave). Let's say we had two methods that we wanted to have tests for, add and prime?, then we can structure our project like so:

/example_project
  +-- lib
  �   +-- add.rb
  �   +-- prime.rb
  +-- spec
      +-- add_spec.rb
      +-- prime_spec.rb
To use RSpec, we must follow this structure. We need folders with the literal names lib and spec as direct children of the example_project folder. The test files inside of the /spec folder must end with _specin their names.

How to Read Specs
You may initially find reading spec files as intimidating because you are interpreting another programmer's code and you don't understand exactly how it works. That's okay! The beauty of RSpec is that you don't need to know every detail of how it works, just look for the big picture idea. RSpec reads like english. To reiterate, our goal right now is to read RSpec, not necessarily write it.

Let's take a look at the contents of /spec/add_spec.rb to see how we test the add method. The behavior outlined in the specs will dictate how we ought to design the method in /lib/add.rb.

# /spec/add_spec.rb

require "add" # this line will include code from "/lib/add.rb"

describe "add method" do
  it "should accept two numbers as arguments" do
    expect { add(2, 3) }.to_not raise_error
  end

  it "should return the sum of the two numbers" do
    expect(add(2, 3)).to eq(5)
    expect(add(10, 12)).to eq(22)
  end
end
Reading this code, you should get the feel of how the add method will be tested. Here's the semantic interpretation of the code:

The description of the add method outlines 2 criteria:
it should accept two numbers as arguments
it should return the sum of the two numbers
By simply looking at the describe and it lines, we get a clear idea of how add should behave. However, if you need more clarity on the meaning, we can look inside of the expects inside of each it block. Let's hone in on the first it block:

it "should accept two numbers as arguments" do
  expect { add(2, 3) }.to_not raise_error
end
Again, this code reads like english. Here's the somewhat obvious interpretation: The expectation is that when we call the add method and pass it two number arguments like 2 and 3, it should not get an error.

Let's focus on the the second it block now:

it "should return the sum of the two numbers" do
  expect(add(2, 3)).to eq(5)
  expect(add(10, 12)).to eq(22)
end
Like you probably guessed, eq is short for "equal". With that in mind, here's the interpretation of the first expect: The expectation is that if we pass the add method 2 and 3 as arguments, it should return the sum, which is equal to 5.

Now that we understand the spec for the add method, let's implement it in /lib/add.rb:

# /lib/add.rb
def add(num_1, num_2)
  num_1 + num_2
end
Nice! Now we know how to read basic RSpec. describe, it, and expect are the fundamental keywords we should focus on, but that's not to say that there aren't other RSpec terms we'll run into in the future. Don't worry, all of these terms are pretty self explanatory. For example, try to interpret the spec we would use for the prime? method:

# /spec/prime_spec.rb
require "prime"

describe "prime? method" do
  it "should accept a number as an argument" do
    expect { prime?(7) }.to_not raise_error
  end

  context "when the number is prime" do
    it "should return true" do
      expect(prime?(7)).to eq(true)
      expect(prime?(11)).to eq(true)
      expect(prime?(13)).to eq(true)
    end
  end

  context "when the number is not prime" do
    it "should return false" do
      expect(prime?(4)).to eq(false)
      expect(prime?(9)).to eq(false)
      expect(prime?(20)).to eq(false)
      expect(prime?(1)).to eq(false)
    end
  end
end
Above we use context additional blocks to outline different scenarios that our code is expected to satisfy. A straight forward interpretation to the first context is: When the number is prime, it should return true.

Wrapping Up
Here are the core RSpec terms you'll see in every spec file:

describe names the method being tested
it names the behavior of the being tested
expect shows how that behavior is tested



Exceptions in Ruby
Exceptions are what Ruby uses to deal with errors or other unexpected events. For now it's okay to use exception and error synonymously. If you have made it this far in the course, chances are you have run into many exceptions. Here we are referring to exceptions in the code that will literally crash your program and stop execution immediately.

Here are two examples of classic exceptions or errors that will halt our execution:

def my_method(arg_1, arg_2)
  puts arg_1
  puts arg_2
end

my_method("a") # ArgumentError: wrong number of arguments (given 1, expected 2)
5 + nil # TypeError: nil can't be coerced into Integer
Upon reaching an exception, the default behavior in ruby is to terminate the program. However, we can also define our own behavior to handle exceptions.

Handling Exceptions
Let's explore how we can implement our own custom exception handling in Ruby. Exception handling can be very involved, but let's just focus on the fundamentals. Let's say we had some isolated code that is vulnerable to an exception:

10 / num
Do you see a potential problem in the code above? That code seems innocuous, right? ...Wrong! What if num is 0:

num = 0

10 / num # ZeroDivisionError: divided by 0

puts "finished"
Reaching the ZeroDivisionError exception would halt execution of the program and we would never get to reach the final puts "finished". This could be deadly if there is some critical code after the exception that we still want to execute, regardless of the fact we got an exception.

With that in mind, let's redesign this code to handle division by zero more gracefully. We'll need to use a new structure that is specific to handling exceptions, begin...rescue.

num = 0

begin
  puts "dividing 10 by #{num}"
  ans = 10 / num
  puts "the answer is #{ans}"
rescue
  puts "There was an error with that division."
end

puts "--------"
puts "finished"
The output of the above code is:

dividing 10 by 0
There was an error with that division.
--------
finished
The behavior of begin...rescue is this: The code in the begin block will execute until an exception is reached. Once an exception is reached, the execution will immediately jump to rescue. This behavior is evident by the fact that the code above doesn't print "the answer is ", because the exception is reached on the line before.

In the event that an exception is never hit in the begin block, then execution will never go to rescue. This is the case in the following code:

num = 5

begin
  puts "dividing 10 by #{num}"
  ans = 10 / num
  puts "the answer is #{ans}"
rescue
  puts "There was an error with that division."
end

puts "--------"
puts "finished"
The output of the above code is:

dividing 10 by 5
the answer is 2
--------
finished
Cool! Now we know the basics of exception handling in ruby. begin running some code, and if something goes horribly wrong, we jump to rescue it. begin...rescue has a somewhat similar control flow to an if...else in that both structures have branching logic. We explored how to handle ZeroDivisionError, but other errors can be rescued too. Here are a few more common error types that are native to ruby:

ArgumentError
NameError
NoMethodError
IndexError
TypeError
This is by no means an exhaustive list, but these are the common ones.

Raising Exceptions
Previously we explored how to handle native exceptions like ZeroDivisionError, but what if we wanted to implement our own exceptions? The point of an exception is to flag an exceptional scenario in the code that should be handled in a specific way. As a programmer, you can decide what those exceptional scenarios are!

Say we wrote this method:

def format_name(first, last)
  first.capitalize + " " + last.capitalize
end

format_name("grace", "HOPPER") # => "Grace Hopper"
It's obvious how this method should be used. That is, we ought to pass in two strings when calling format_name. But this is still prone to misuse:

format_name(42, true) # => NoMethodError: undefined method `capitalize' for 42:Integer
This code will reach a native exception, but it could be better. We want the exception message to really describe how our format_name method was misused. Right now the error message really pertains to misuse of capitalize. The current exception message is also uncomfortable because it exposes the inner implementation details of our format_name method. For someone that is calling our method, maybe we don't want them to know what operations we do inside. If they have intelligence of the inner workings of our method, they could use that knowledge to deduce how to break our code. We know, we know, format_name is a harmless method, but if it was an absolutely critical method, we would want to protect it.

We'll let you be the judge, which exception do you think is more appropriate:

format_name(42, true) # => NoMethodError: undefined method `capitalize' for 42:Integer
# OR
format_name(42, true) # => RuntimeError: arguments must be strings
Let's implement the second exception! Since we want to raise an exception when the arguments are not strings, we'll need a quick aside on how to check data type:

"hello".instance_of?(String)  # => true
42.instance_of?(String)       # => false
Simple enough! Let's use this to rewrite format_name:

def format_name(first, last)
  if !(first.instance_of?(String) && last.instance_of?(String))
    raise "arguments must be strings"
  end

  first.capitalize + " " + last.capitalize
end

format_name("grace", "hopper") # => "Grace Hopper"
format_name(42, true)          # => RuntimeError: arguments must be strings
In the code above we see raise, this is how we can make exceptions manually. You'll commonly hear the phrase "raise an error" or "raise an exception" to refer to this.

Bring it all together
Since our format_name method can raise an exception, we can also handle it with begin...rescue.

def format_name(first, last)
  if !(first.instance_of?(String) && last.instance_of?(String))
    raise "arguments must be strings"
  end

  first.capitalize + " " + last.capitalize
end

first_name = 42
last_name = true
begin
  puts format_name(first_name, last_name)
rescue
  # do stuff to rescue the "arguments must be strings" exception...
  puts "there was an exception :("
end
An important distinction to note is that raise is how we bring up an exception, whereas begin...rescue is how we react to that exception.

There is much more to exceptions in ruby, but these are the fundamentals that you'll need for alpha course. In the course, you'll run into scenarios where a spec may say "should raise an error when...". Solving these specs can be as simple as using raise with an if statement, just like we explored in our format_name method!


