def perfect_square(x)
    if x == 0
        return true
    else 
        for y in 1..x
            return true if (x.to_f / y.to_f) == y
        end
  
    false
    end  
end
  
puts perfect_square(-4) #false
puts perfect_square(0) #true
puts perfect_square(3) #false
puts perfect_square(4) #true
puts perfect_square(25) #true
puts perfect_square(26) #false
