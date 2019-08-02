class Book
  def title
    @name
  end

  def title=(name)
    little_words = %w{the a an and in of}#Next ill create an array to check if the words equal the following. and, the, in, of, an, a
    name.capitalize! #Capitalizing the first letter of the title automatically
    @name = name.gsub(/\w+(\Z|\s)/) {|word| little_words.include?(word.strip) ? word : word.capitalize}#I use gsub to replace the first value with the secondary value provided through little_words and capitalization
  end
end
# That will create functionality for the entirety of the project

