NUM_ROWS = 3
NUM_COLUMNS = 3
EMPTY = '_'
X = 'X'
O = 'O'

class Game 
  constructor: (startingBoard) ->
    # Default start is an empty board
    @board = startingBoard ? [ [EMPTY, EMPTY, EMPTY], [EMPTY, EMPTY, EMPTY], [EMPTY, EMPTY, EMPTY] ]

  isFinished: ->
    # no square is empty
    for row in [0..NUM_ROWS - 1]
      for column in [0..NUM_COLUMNS - 1]
        if @board[row][column] is EMPTY
          return false
    return true

  isDraw: ->
    # at this point all finished games are draws
    if (@isFinished() is true) &&
       (@isWinForO() is false) &&
       (@isWinForX() is false)
      true
    else
      false

  isWinForO: -> 
    OWins = false
    # check each row for all noughts
    for row in [0..NUM_ROWS - 1]
      if (@board[row][0] is O &&
          @board[row][1] is O &&
          @board[row][2] is O) 
        OWins = true

    # check columns for all noughts
    for column in [0..NUM_ROWS - 1]
      if (@board[0][column] is O &&
          @board[1][column] is O &&
          @board[2][column] is O) 
        OWins = true

    # check both diagonals for all noughts
    if (@board[0][0] is O &&
        @board[1][1] is O &&
        @board[2][2] is O)
      OWins = true
    if (@board[0][2] is O &&
        @board[1][1] is O &&
        @board[2][0] is O)
      OWins = true

    # return win bool
    return OWins

  isWinForX: -> 
    XWins = false
    # check each row for all crosses
    for row in [0..NUM_ROWS - 1]
      if (@board[row][0] is X &&
          @board[row][1] is X &&
          @board[row][2] is X) 
        XWins = true

    # check columns for all crosses
    for column in [0..NUM_ROWS - 1]
      if (@board[0][column] is X &&
          @board[1][column] is X &&
          @board[2][column] is X) 
        XWins = true
        
    # check both diagonals for all crosses
    if (@board[0][0] is X &&
        @board[1][1] is X &&
        @board[2][2] is X)
      XWins = true
    if (@board[0][2] is X &&
        @board[1][1] is X &&
        @board[2][0] is X)
      XWins = true

    # return win bool
    return XWins

exports.Game = Game
exports.X = X
exports.O = O
exports.EMPTY = EMPTY