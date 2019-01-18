require 'colorize'
class Ship
attr_accessor :size, :name, :hp, :icon, :length
    def initialize(size, name, hp, icon, length)
        @size = size
        @name = name
        @hp = hp
        @icon = icon
        @length = length
        # @orientation = ship_orientation
    end
    
    def length
        @length
    end

    def size 
        @size
    end

    def icon
        @icon
    end

    # def ship_orientation
    #     @orientation
    # end

    # def set_ship_orientation

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

    def hit
    #   @name +  " Direct Hit " + "ship size is " + @size.to_s
      if @hp >= 1
      @hp =  @hp - 1
      puts"Direct Hit !!!"
    #   @name + " Takes a hit " + " Hp is down to " + @hp.to_s
      else
      p @name + " Ship is Destroyed "
      end  
    end

    def location
    @column = column
    @row = row
    end
            

    def info
        @name +  " Ship size is " + @size.to_s + " Ships Hp is  " + @hp.to_s
      end

    def hp 
        @hp
    end

    def set_hp=(health)
        @hp = health
    end
end


