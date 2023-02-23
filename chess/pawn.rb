require_relative "piece"

class Pawn < Piece

    def symbol
        '♙'.colorize(color)
    end

    def moves


        possible_moves = []
        current_position = self.position
        cx, cy = current_position

        side_attacks.each do |step|
            dx, dy = step
            if ((dx + cx).between?(0,7) && (dy + cy).between?(0,7) &&
                (!self.board[[(dx + cx), (dy + cy)]].empty? && self.board[[(dx + cx), (dy + cy)]].color != self.color))

                new_pos = [(dx + cx), (dy + cy)]
                possible_moves << new_pos
            end
        end



        forward_steps.each do |step|
            dx, dy = step
            if !(self.board[[(dx + cx), (dy + cy)]].empty?) && at_start_row?
                break
            elsif ((dx + cx).between?(0,7) && (dy + cy).between?(0,7) && (self.board[[(dx + cx), (dy + cy)]].empty? || self.board[[(dx + cx), (dy + cy)]].color != self.color))
                new_pos = [(dx + cx), (dy + cy)]
                possible_moves << new_pos
            end
        end


        possible_moves


    end

    def at_start_row?

        if self.color == :black && self.position[0] == 1
            return true
        elsif self.color == :white && self.position[0] == 6
            return true
        end

        false

    end

    def forward_dir

        return [1, 0] if self.color == :black
        return [-1, 0] if self.color == :white

    end

    def forward_steps

        if self.at_start_row? && self.color == :black
            [[1, 0], [2, 0]]
        elsif self.at_start_row? && self.color == :white
            [[-1, 0], [-2, 0]]
        else
            self.forward_dir
        end

    end

    def side_attacks

        if self.color == :black
            [[1, 1], [1, -1]]
        elsif self.color == :white
            [[-1, -1], [-1, 1]]
        end

    end


end


# def moves
#     possible_moves = []
#     current_position = self.position
#     cx, cy = current_position

#     move_diffs.each do |diffs|
#         dx, dy = diffs

#         if ((dx + cx).between?(0,7) && (dy + cy).between?(0,7) && (self.board[[(dx + cx), (dy + cy)]].empty? || self.board[[(dx + cx), (dy + cy)]].color != self.color))

#             new_pos = [(dx + cx), (dy + cy)]
#             possible_moves << new_pos
#         end
#     end

#     possible_moves

# end
