class Timer
    def initialize
        @seconds = 0
    end

    def seconds
        @seconds
    end

    def seconds=(seconds)
        @seconds = seconds
    end

    def time_string
        sec = @seconds
        hour = sec / 3600 # divides the number of seconds to get the number of hours
        sec -= hour * 3600 # removes that number from the seconds variable
        min = sec / 60 # divides the number of seconds to get the number of minutes
        sec -= min * 60 # removes that number from the seconds variable
        hour.to_s.rjust(2, "0") + ":" + min.to_s.rjust(2, "0") + ":" + sec.to_s.rjust(2, "0") #Converts the number of hours to a string
    end #rjust is new to me, if integer is greater than the length of str, returns a new string of length integer with str right justified and padded with padstr; otherwise, returns str.
end
