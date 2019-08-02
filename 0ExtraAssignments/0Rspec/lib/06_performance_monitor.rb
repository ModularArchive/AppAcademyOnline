def measure(counter=1)
    total = 0 #begins the variable value of total at 0
    counter.times do 
    starting = Time.now #Calling on Time from the spec file

yield #When a block is recognized itll be associated to the involved method and replace the yield in the method with itself
        endTime = Time.now
    total += endTime - starting
end
    return total/counter
end


#def measure(counter=1) what I contemplated doing
#    time_starting = Time.now       (Gets current)
#    counter.times {yield}
#    (Time.now - time_starting)/counter