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

    def []=(pos,piece)
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
        @board[i][j] = @board[x][y]
        @board[x][j] = nil
    end


    def display
        arr = []
        @board.each do |row|
            subarr = []
            row.each do |ele|
                ele.nil? ? subarr << "_"  : subarr << ele.color
            end
            arr << subarr
        end
        arr
    end
                

end