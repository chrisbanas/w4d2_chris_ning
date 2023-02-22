require_relative "piece"

module Slideable

    private

    # row - X stays the same and Y changes (+1 or -1)
    # col - Y stays the same and X changes (+1 or -1)
    HORIZONTAL_DIRS = [[0, -1], [-1, 0], [1, 0], [0, 1]].freeze

    # NW +1, +1 or SE -1, -1
    # SW +1, -1, or NE -1, +1
    DIAGONAL_DIRS = [[1, 1], [-1, -1],[1, -1], [-1, 1]].freeze

    public

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        possible_moves = []
        move_dirs.each do |dir|
            dx, dy = dir
            possible_moves << self.grow_unblocked_moves(dx, dy)
        end
        possible_moves
    end

    private

    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves(dx, dy)
        new_moves = []
        current_position = self.position
        cx, cy = current_position

        until !(board[[(dx + cx), (dy + cy)]].nil? && (dx + cx).between?(0..7) && (dy + cy).between?(0..7))
            new_pos = [(dx + cx), (dy + cy)]
            new_moves << new_pos
            cx, cy = new_pos
        end

        new_moves
    end



end
