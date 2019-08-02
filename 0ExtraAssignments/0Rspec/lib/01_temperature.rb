def ftoc(temp)
    (temp - 32) * 5 / 9 #adjusting 32 degrees due to the difference in freezing levels, then multiplying by 5/9
end
def ctof(temp)
    temp * 9.0 / 5 + 32 # I included .0 to the 9 so it would create fractions, satisfying some of the ctof expectations
end