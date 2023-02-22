require_relative "slideable"
require_relative "piece"



class Pawn < Piece
    include Slideable

    def symbol
        '♙'.colorize(color)
    end

    def move_dirs
       
    end


end