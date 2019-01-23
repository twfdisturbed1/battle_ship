class Ship
attr_accessor :size, :name, :hp, :icon, :length, :orientation, :ship_status, :ship

    def initialize(size, name)
        @size = size
        @name = name
        @hp = 0
    end
    
    def length
        @length
    end

    def icon
        @icon
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


    def set_ship_orientation=(set_ship_orientation)
        @orientation = set_ship_orientation
    end

    def set_icon=(icon_letter)
        @icon = icon_letter
    end

    def set_ship_size=(number)
        @size = number
    end

    def name
        @name
    end

    def set_name=(title)
        @name = title
    end

    def location
    @column = column
    @row = row
    end
            
    def info
        @name +  " Ship size is " + @size.to_s + " Ships Hp is  " + @hp.to_s
      end

    def take_a_hit()
        @hp += 1
        if @hp == @size
            return "#{name.capitalize} was Destroyed"
        else
            return "You hit a ship!"
        end
    end


end


