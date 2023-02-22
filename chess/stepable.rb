require_relative "piece"

module Stepable

    KNIGHT_DIRS = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]

    KING_DIRS = [[1, 1], [0, 1], [1, 0], [-1, 0], [-1, -1], [0, -1], [1, -1], [-1,1]]

    def moves
        move_diffs.each do |diffs|
            dx, dy = diffs
            self.board[[(dx + cx), (dy + cy)]].nil?&&(dx + cx).between?(0,7) && (dy + cy).between?(0,7)
    end

    def move_diffs
        raise NotImplementedError
    end

end