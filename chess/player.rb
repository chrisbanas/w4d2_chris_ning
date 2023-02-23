require_relative "board"
require_relative "display"

class Player
    def initialize(symbol, display)
        @symbol = symbol
        @display  = Display.new 
    end

end