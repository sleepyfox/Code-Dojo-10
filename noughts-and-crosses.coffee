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

  isWinForO: -> 
    OWins = false
    # check each row for all noughts
    if (@lineOfThreeHorizontally(O)) then OWins = true

    # check columns for all noughts
    if (@lineOfThreeVertically(O)) then OWins = true

    # check both diagonals for all noughts
    if (@lineOfThreeDiagonally(O)) then OWins = true

    # return win bool
    return OWins

  isWinForX: -> 
    XWins = false
    # check each row for all crosses
    if (@lineOfThreeHorizontally(X)) then XWins = true

    # check columns for all crosses
    if (@lineOfThreeVertically(X)) then XWins = true

    # check both diagonals for all crosses
    if (@lineOfThreeDiagonally(X)) then XWins = true

    # return win bool
    return XWins

exports.Game = Game
exports.X = X
exports.O = O
exports.EMPTY = EMPTY