require_relative "piece"

class Board
    attr_reader :board
    def initialize
        @board = Array.new(8){Array.new(8,nil)}
        @nulpiece = nil

    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, piece)
        row, col = pos
        @board[row][col] = piece
    end

    def fill_board
        (0..7).each do |i|
            @board[0][i] = Piece.new(:B, self, [0, i])
            @board[1][i] = Piece.new(:B, self, [1, i])
            @board[6][i] = Piece.new(:W, self, [6, i])
            @board[7][i] = Piece.new(:W, self, [7, i])
        end
    end




    def move_piece(start_pos, end_pos)
        if start_pos.nil? && !end_pos.nil?
            raise "not valid move"
        end
        x, y = start_pos
        i, j = end_pos
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end


    def display
        arr = []
        @board.each do |row|
            subarr = []
            row.each do |ele|
                ele.nil? ? subarr << ""  : subarr << ele.color
            end
            arr << subarr
        end
        arr
    end


end

if $PROGRAM_NAME == __FILE__

    b = Board.new
    b.fill_board

    b.board
    p b.display
    b.move_piece([0,0], [2,0])
    puts
    p b.display

    p r = Rook.new(:white, b, [0,1])

end
