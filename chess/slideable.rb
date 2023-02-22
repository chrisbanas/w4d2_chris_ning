require_relative "piece"

module Slideable

    private

    # row - X stays the same and Y changes (+1 or -1)
    # col - Y stays the same and X changes (+1 or -1)
    HORIZONTAL_DIRS = [[0, -1], [-1, 0], [1, 0], [0, 1]]

    # NW +1, +1 or SE -1, -1
    # SW +1, -1, or NE -1, +1
    DIAGONAL_DIRS = [[1, 1], [-1, -1],[1, -1], [-1, 1]]

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
            self.grow_unblocked_moves(dx, dy)

            new_pos = current_position[0]

            possible_moves << new_pos
        end

        possible_moves
    end

    def grow_unblocked_moves(dx, dy)
        self.horizontal_dirs.each
    end



end
