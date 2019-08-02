class Dictionary
  def initialize #Creating an instanced variable so they're accessible anywhere within the class, rather than just the block
    @entries = {} 
  end

  def entries
    @entries
  end

  def add(entry) 
    if entry.is_a?(Hash) #if entry is array, Hash
      @entries[entry.keys[0]] = entry.values[0] #returns new array with keys from hash, then use .values to take all of the values from the hash and display them in an orderly fassion
    else
      @entries[entry] = nil #if entry isnt an array then the entry becomes nil
    end
  end

  def keywords
    @entries.keys.sort #gets @entries keys and returns a new array, then sorts that string.
  end

  def include?(entry)
    @entries.include?(entry) #checks @entries array to see if the keyword typed into (entry) is there, if so it returns true, else it's false
  end

  def find(entry)
    result = {}
    @entries.keys.each { |key| result[key]=@entries[key] if key[0..(entry.length-1)] == entry }
    result
  end

  def printable
    result = '' #empty string value for result
    keywords.each {|key| result << '[' + key + '] "' + @entries[key] + '"'+ "\n" } #creates a string form of the dictionary infromation by creating brackets for the keyword, and parentheses for the definition, then providing the neccessary \n at the end of each dictionary insertion
    result[0..-2] #displays all of the results
  end
end
