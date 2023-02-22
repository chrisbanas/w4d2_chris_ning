require_relative "slideable"
require_relative "piece"

class Rook
    include Slideable
    def initialize
        @symbol = :R
    end

    def move_dirs
        horizontal_dirs
    end


end
