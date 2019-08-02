class Friend
  def greeting(who=nil) #I saw the default value to nil so i can check if a value is entered or not
    if who != nil #if it doesnt equal nil (in other words the value isn't empty)
      "Hello, " + who + "!" # execute string Hello, {who} + ! giving Hello, Bob! using the spec example
    else  #if the value does equal nil
      "Hello!"  #Execute a simple "Hello!" string
    end
  end
end
