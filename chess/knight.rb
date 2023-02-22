require_relative "slideable"
require_relative "piece"



class Knight < Piece
    include Slideable

    def symbol
        '♞'.colorize(color)
    end

    def move_dirs
       
    end


end