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

  # Placeholder functions
  isWinForX: -> false
  isWinForO: -> false

exports.Game = Game
exports.X = X
exports.O = O
exports.EMPTY = EMPTY