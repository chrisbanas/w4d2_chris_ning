require_relative "board"
require_relative "cursor"

class Display 
    attr_reader :board
    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0],self.board)
    end

  

    def print_board
        board.display.each {|row| puts row.join(" ")}
    end

    


end

if $PROGRAM_NAME == __FILE__


    b = Display.new
    
    b.board.fill_board

    # b.board
    
    b.board.move_piece([0,0], [2,0])
    b.board.move_piece([0,3], [3,3])
    b.board.move_piece([6,6], [2,6])
    b.board.move_piece([6,5], [2,5])
    # b.move_piece([2,0], [3,4])

    b.print_board

    #  p b[[6,1]].moves
     p b.board[[1, 6]].moves

    # p b[[2,0]].moves
    # puts
    # p b[[0,1]].moves
    # puts
    # p b[[0,4]].moves
    # puts
    # p b[[3,3]].moves
    # # p b[[2,0]].move_dirs





end
