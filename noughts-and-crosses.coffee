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
    if (@isFinished() is true) &&
       (@isWinForO() is false) &&
       (@isWinForX() is false)
      true
    else
      false

  lineOfThreeVertically: (player) ->
    win = false
    for column in [0..NUM_COLUMNS - 1]
      if (@board[0][column] is player &&
          @board[1][column] is player &&
          @board[2][column] is player) 
        win = true
    return win

  lineOfThreeHorizontally: (player) ->
    win = false
    for row in [0..NUM_ROWS - 1]
      if (@board[row][0] is player &&
          @board[row][1] is player &&
          @board[row][2] is player) 
        win = true
    return win

  lineOfThreeDiagonally: (player) ->
    win = false
    if (@board[0][0] is player &&
        @board[1][1] is player &&
        @board[2][2] is player)
      win = true
    if (@board[0][2] is player &&
        @board[1][1] is player &&
        @board[2][0] is player)
      win = true
    return win

  isWinFor: (player) ->
    if (@lineOfThreeHorizontally(player) ||
        @lineOfThreeVertically(player) ||
        @lineOfThreeDiagonally(player))
      true
    else
      false 

  isWinForO: -> 
    @isWinFor O

  isWinForX: -> 
    @isWinFor X

exports.Game = Game
exports.X = X
exports.O = O
exports.EMPTY = EMPTY