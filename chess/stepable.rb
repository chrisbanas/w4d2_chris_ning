require_relative "piece"

module Stepable

    attr_reader :moves

    KNIGHT_DIRS = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]

    KING_DIRS = [[1, 1], [0, 1], [1, 0], [-1, 0], [-1, -1], [0, -1], [1, -1], [-1, 1]]

    def knight_dirs
        KNIGHT_DIRS
    end

    def king_dirs
        KING_DIRS
    end

    def moves
        possible_moves = []
        current_position = self.position
        cx, cy = current_position

        move_diffs.each do |diffs|
            dx, dy = diffs

            if ((dx + cx).between?(0,7) && (dy + cy).between?(0,7) && (self.board[[(dx + cx), (dy + cy)]].empty? || self.board[[(dx + cx), (dy + cy)]].color != self.color))

                new_pos = [(dx + cx), (dy + cy)]
                possible_moves << new_pos
            end
        end

        possible_moves

    end

    def move_diffs
        raise NotImplementedError
    end

end
