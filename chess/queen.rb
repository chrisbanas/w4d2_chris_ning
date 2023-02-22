require_relative "slideable"
require_relative "piece"



class Queen
    include Slideable
    def initialize
        @symbol = :Q
    end

    def move_dirs
        diagonal_dirs.concat(horizontal_dirs)
    end


end
