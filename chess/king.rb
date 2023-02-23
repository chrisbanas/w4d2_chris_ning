require_relative "stepable"
require_relative "piece"



class King < Piece
    include Stepable

    def symbol
        '♚'.colorize(color)
    end

    def move_diffs
        king_dirs
    end


end
