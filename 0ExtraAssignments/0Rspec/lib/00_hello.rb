def hello #defining the hello that's referenced in 00_hello_spec line 107
    "Hello!"    #Validating the expected Hello! in 00_hello_spec line 107
end #end of hello function
def greet(who)  #defining greet function that's referenced in line 113 and 117 in 00_hello_spec line, who is a variable within the function
    "Hello, #{who}!" #Creating a string that has the beginning validation (Hello,) and the second #{who}! which is used to call the empty variable who into the string
end
