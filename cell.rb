require_relative 'ship.rb'
class Cell     
    attr_reader :name, :ship, :size, :coordinates, :content, :status, :icon
    def initialize()
        @status = "open"
        @content = "~~ " 
        @size = size 
        @ship = ship
        @name = name
        @icon = name
        
    end

    def if_hit()
        if @content.class == Ship
            @content.take_a_hit() 
            @status = "X" 
        elsif @content == "~~ "
           @status = "O"
        end
    end
    
    def take(ship)
        @content = ship
            @status = "taken"
    end

    def content()
        @content
    end

    def to_s()
        if @status == "open"
            return "~~ "
        elsif @status == "taken"
            return @content.name
        end
        "(#{@status})"

    end
end