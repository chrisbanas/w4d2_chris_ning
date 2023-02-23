require_relative "stepable"
require_relative "piece"



class Knight < Piece
    include Stepable

    def symbol
        '♞'.colorize(color)
    end

    def move_diffs
        knight_dirs
    end


end
