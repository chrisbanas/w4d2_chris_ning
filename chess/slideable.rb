require_relative "piece"



module Slideable
    attr_reader :moves


    # row - X stays the same and Y changes (+1 or -1)
    # col - Y stays the same and X changes (+1 or -1)
    HORIZONTAL_DIRS = [[0, -1], [-1, 0], [1, 0], [0, 1]]

    # NW +1, +1 or SE -1, -1
    # SW +1, -1, or NE -1, +1
    DIAGONAL_DIRS = [[1, 1], [-1, -1],[1, -1], [-1, 1]]



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
            possible_moves += self.grow_unblocked_moves(dx, dy)
        end
        possible_moves
    end

    # private

    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves(dx, dy)
        new_moves = []
        current_position = self.position
        cx, cy = current_position


        until !((dx + cx).between?(0,7) && (dy + cy).between?(0,7) && (self.board[[(dx + cx), (dy + cy)]].empty? || self.board[[(dx + cx), (dy + cy)]].color != self.color))
            new_pos = [(dx + cx), (dy + cy)]
            new_moves << new_pos
            if self.board[[(dx + cx), (dy + cy)]].color == :blue
            elsif self.board[[(dx + cx), (dy + cy)]].color != self.color
                break
            end
            cx, cy = new_pos
        end

        new_moves
    end



end
