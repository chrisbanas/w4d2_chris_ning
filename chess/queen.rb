require_relative "slideable"
require_relative "piece"



class Queen < Piece
    include Slideable

    def symbol
        '♛'.colorize(color)
    end

    def move_dirs
        diagonal_dirs.concat(horizontal_dirs)
    end


end
