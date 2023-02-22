require "colorize"

class Piece
    attr_accessor :color, :board, :position

    def initialize(color, board, position)
        @color = color
        @board = board
        @position = position
    end

    def empty?
        false
    end


end
