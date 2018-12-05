class Ship
attr_accessor :size, :name
    def initialize(size, name, hp)
        @size = size
        @name = name
        @hp = hp
    end

    def size 
        @size
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
      @name +  " Direct Hit " + "ship size is " + @size.to_s
      if @hp >= 2
      @hp =  @hp - 1
      @name + " Takes a hit " + " Hp is down to " + @hp.to_s
      else
     @name + " Ship is Destroyed "
      end  
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

destroyer = Ship.new(2, "Destroyer", 2)
submarine = Ship.new(3, "Submarine", 3)
cruiser = Ship.new(4, "Cruiser", 4)
battleship = Ship.new(5, "Battleship ", 5)


p destroyer.info
p submarine.info
p cruiser.info
p battleship.info


p battleship.hit
p battleship.hit
p battleship.hit


p battleship.info

p cruiser.hit
p cruiser.hit
p cruiser.hit
p cruiser.hit
