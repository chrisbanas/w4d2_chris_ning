require_relative "slideable"
require_relative "piece"

class Bishop < Piece
    include Slideable

    def symbol
        '♝'.colorize(color)
    end

    def move_dirs
        diagonal_dirs
    end


end
