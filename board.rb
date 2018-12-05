    puts "pick 1 or 2 or 3 for board size"
    puts "1 is 12 by 12 "
    puts "2 is 24 by 24 "
    puts "3 is 36 by 36 "
    start = 0
    size = 0
loop do
start = gets.chomp.to_i
    if start == 1
        size = 12
    break
    
    elsif start == 2
        size = 24
    break
    
    elsif start == 3
        size = 36
    break
    else    
    puts "Pick a valid number"
    redo
    end
end

x = Array.new(size,Array.new(size,""))

x.each do|v|
    p v
end


