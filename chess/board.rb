require_relative "filepath"


class Board
    attr_reader :board
    def initialize
        @board = Array.new(8){Array.new(8,NullPiece.instance)}
        self.fill_board
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
            @board[1][i] = Pawn.new(:black, self, [0, i])
            @board[6][i] = Pawn.new(:white, self, [6, i])
        end
        @board[0][0] = Rook.new(:black, self, [0, 0])
        @board[0][1] = Knight.new(:black, self, [0, 1])
        @board[0][2] = Bishop.new(:black, self, [0, 2])
        @board[0][3] = Queen.new(:black, self, [0, 3])
        @board[0][4] = King.new(:black, self, [0, 4])
        @board[0][7] = Rook.new(:black, self, [0, 7])
        @board[0][6] = Knight.new(:black, self, [0, 6])
        @board[0][5] = Bishop.new(:black, self, [0, 5])
        @board[7][0] = Rook.new(:white, self, [7, 0])
        @board[7][1] = Knight.new(:white, self, [7, 1])
        @board[7][2] = Bishop.new(:white, self, [7, 2])
        @board[7][3] = Queen.new(:white, self, [7, 3])
        @board[7][4] = King.new(:white, self, [7, 4])
        @board[7][7] = Rook.new(:white, self, [7, 7])
        @board[7][6] = Knight.new(:white, self, [7, 6])
        @board[7][5] = Bishop.new(:white, self, [7, 5])
       
    
    end




    def move_piece(start_pos, end_pos)
        if self[start_pos].empty? || !self[end_pos].empty?
            raise "not valid move"
        end
        x, y = start_pos
        i, j = end_pos
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance
        self[end_pos].position = end_pos
    end


    def display
        arr = []
        @board.each do |row|
            subarr = []
            row.each do |ele|
                ele.empty? ? subarr << " "  : subarr << ele.symbol
            end
            arr << subarr
        end
        arr
    end
    
    def print_board
        display.each {|row| puts row.join(" ")}
    end

    


end

if $PROGRAM_NAME == __FILE__

    b = Board.new
    b.fill_board

    b.board
    b.display
    b.move_piece([0,0], [2,0])
    b.move_piece([2,0], [3,4])
    
    b.print_board

    p b[[3,0]].symbol

    # p b[[2,0]].moves
    # # p b[[2,0]].move_dirs

    


   
end
