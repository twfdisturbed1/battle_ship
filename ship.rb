class Ship
attr_accessor :size, :name, :hp,  :message, :ship_status, :ship

    def initialize(size, name)
        @size = size
        @name = name
        @hp = 0
    end

    def type_of_ship()
        return @name
    end

    def size_of_ship()
        return @size
    end

    def hitter()
        return @hp
    end
            
    def info
        @name +  " Ship size is " + @size.to_s + " Ships Hp is  " + @hp.to_s
      end

    def take_a_hit()
        @hp += 1
        if @hp != @size
            @message = "Direct Hit !!"
        elsif @hp == @size 
            @message  = "#{name} was Sunk!"
            return @message
        end
    end


end


