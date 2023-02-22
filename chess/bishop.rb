require_relative "slideable"
require_relative "piece"

class Bishop
    include Slideable
    def initialize
        @symbol = :B
    end

    def move_dirs
        diagonal_dirs
    end


end
