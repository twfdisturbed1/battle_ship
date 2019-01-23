require_relative "cell.rb"
require_relative "ship.rb"
class Cpucell < Cell
       attr_reader :ship, :size, :coordinates, :content, :status
    def to_s()
        if @status == "open" || @status == "taken"
            return "~~ "
        end
        "(#{@status})"

        
    end

end