class Temperature #need to create functionality for Temperature, :f, in_fahrenheit, from_fahrenheit, ftoc, ctof, :c, in_celsius, from_celsius, Celsius, Fahrenheit
  def initialize(options = {}) #default value is a starting empty array
    if options.include?(:f) #creates basic f fahrenheit function
        @temp = options[:f]
    end
    if options.include?(:c) #checks if options includes :c, if so it returns a true value
        @temp = Temperature.ctof(options[:c]) #creates basic c celcius function
    end
  end

  def self.ftoc tempf
    (tempf - 32.0) * 20 / (68 - 32) #New formula for planning the Fahrenheit to Celsius conversion
  end

  def self.ctof tempc
    tempc / 20.0 * (68 - 32) + 32 #New formula for planning the Celsius to Fahrenheit conversion
  end

  def self.from_celsius(temp)
    Temperature.new(:c => temp)
  end

  def self.from_fahrenheit(temp)
    Temperature.new(:f => temp)
  end

  def in_celsius
    Temperature.ftoc(@temp) #equal to turning fahrenheit to celsius
  end

  def in_fahrenheit #equal to turning celsius to fahrenheit
    @temp
  end
end

class Celsius < Temperature #For extra credit retargets Celcius to ctof
  def initialize(temp)
    @temp = Celsius.ctof(temp)
  end
end

class Fahrenheit < Temperature #for extra credit retargets Fahrenheit
  def initialize(temp)
    @temp = temp
  end
end
