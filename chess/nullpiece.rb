require_relative "piece"
require "singleton"

class NullPiece < Piece
    include Singleton
    attr_accessor :moves, :symbol
    def initialize
        @symbol = ' '
        @color = :blue
    end

    def moves
        []
    end

    def empty?
        true
    end

end

