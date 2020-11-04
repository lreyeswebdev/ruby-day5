def is_square(x)
    (0..x).each do |ctr|
        return true if (ctr*ctr) == x
    end

    false
end

puts is_square(36) #true