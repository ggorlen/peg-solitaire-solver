# represents a triangular peg solitaire game
class TriangularPegSolitaire
  attr_reader :board

  def initialize(board = nil)
    @board = board
    @board = [
      ["x"],
      ["x", "x"],
      ["x", "o", "x"],
      ["x", "x", "x", "x"],
      ["x", "x", "x", "x", "x"]
    ] if board == nil
  end

  # returns a list of all moves available on the board as an 
  # array of hashes enumerating the destination blank space 
  # and a list of two participating occupied squares
  def get_moves
    moves = []

    get_empty_squares.each do |square|
      get_moves_at(square[:row], square[:col]).each do |move|
        moves << { :empty_square => square, :peg_squares => move }
      end
    end

    moves
  end

  # returns a list of valid moves for an empty square as coordinate pairs 
  #
  # pegs must be present at:
  # row + 2, col     && row + 1, col     ||
  # row + 2, col + 2 && row + 1, col + 1 ||
  # row - 2, col - 2 && row - 1, col - 1 ||
  # row - 2, col     && row - 1, col     ||
  # row, col + 2     && row, col + 1     ||
  # row, col - 2     && row, col - 1     
  def get_moves_at(row, col)
    [
      [
        { :row => row + 2, :col => col }, 
        { :row => row + 1, :col => col }
      ],
      [
        { :row => row + 2, :col => col + 2 }, 
        { :row => row + 1, :col => col + 1 }
      ],
      [
        { :row => row - 2, :col => col - 2 }, 
        { :row => row - 1, :col => col - 1 }
      ],
      [
        { :row => row - 2, :col => col }, 
        { :row => row - 1, :col => col }
      ],
      [
        { :row => row, :col => col + 2 }, 
        { :row => row, :col => col + 1 }
      ],
      [
        { :row => row, :col => col - 2 }, 
        { :row => row, :col => col - 1 }
      ]
    ].inject([]) do |valid_moves, candidate|
      valid_moves << candidate if candidate.all? do |square| 
        in_bounds?(square[:row], square[:col]) && 
        @board[square[:row]][square[:col]] == "x"
      end
      valid_moves
    end
  end

  # returns a list of empty squares on the board
  def get_empty_squares
    empty_squares = []

    @board.each_with_index do |row, i| 
      row.each_with_index do |square, j|
        if square != "x"
          empty_squares << { :row => i, :col => j }
        end
      end
    end

    empty_squares
  end

  # checks if a coordinate pair is on the board
  def in_bounds?(row, col)
    row >= 0 && row < @board.size && 
    col >= 0 && col <= row
  end
  
  # performs a move on the board given a destination 
  # square and a source array of squares
  def move(move)
    @board[move[:empty_square][:row]][move[:empty_square][:col]] = "x"
    @board[move[:peg_squares][0][:row]][move[:peg_squares][0][:col]] = "o"
    @board[move[:peg_squares][1][:row]][move[:peg_squares][1][:col]] = "o"
  end

  # returns true if solved (i.e. 1 peg left), false otherwise
  def solved?
    peg_count = 0

    @board.each do |row|
      row.each do |square|
        peg_count += 1 if square == "x"
        return false if peg_count > 1
      end
    end

    true
  end

  # deep copies the game board
  def deep_copy
    return TriangularPegSolitaire.new(Marshal.load(Marshal.dump(@board)))
  end

  # test if this board equals another board
  def eql?(other)
    @board.each_with_index do |row, i|
      row.each_with_index do |square, j|
        return false if square != other.board[i][j]
      end
    end

    true
  end

  # generates a hash for this board
  def hash
    @board.hash
  end

  # prints the board
  def to_s
    width = @board.size * 2

    "\n" + @board.map do |row|
      row.map do |elem| 
        " " + elem 
      end.join.center(width) + "\n"
    end.join + "\n"
  end
end
