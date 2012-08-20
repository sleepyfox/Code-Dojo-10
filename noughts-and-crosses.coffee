NUM_ROWS = 3
NUM_COLUMNS = 3
EMPTY = '_'
X = 'X'
O = 'O'

class Game 
  # default board is empty
  constructor: (@board = [ [EMPTY, EMPTY, EMPTY], [EMPTY, EMPTY, EMPTY], [EMPTY, EMPTY, EMPTY] ]) ->

  isFinished: ->
    # no square is empty
    for row in [0..NUM_ROWS - 1]
      for column in [0..NUM_COLUMNS - 1]
        filled = filled ? true && (@board[row][column] isnt EMPTY) 
    filled

  isDraw: ->
    if (@isFinished() is true &&
        @isWinFor(O) is false &&
        @isWinFor(X) is false)
      true
    else
      false

  lineOfThreeVertically: (player) ->
    win = false
    for column in [0..NUM_COLUMNS - 1]
      win = win || (@board[0][column] is player &&
                    @board[1][column] is player &&
                    @board[2][column] is player) 
    win

  lineOfThreeHorizontally: (player) ->
    win = false
    for row in [0..NUM_ROWS - 1]
      win = win || (@board[row][0] is player &&
                    @board[row][1] is player &&
                    @board[row][2] is player) 
    win

  lineOfThreeLeadingDiagonal: (player) ->
    win = win ? true && (@board[i][i] is player) for i in [0..NUM_ROWS - 1]
    win

  lineOfThreeTrailingDiagonal: (player) ->
    win = win ? true && (@board[NUM_ROWS - 1 - i][i] is player) for i in [0..NUM_ROWS - 1]
    win

  lineOfThreeDiagonally: (player) ->
    if (@lineOfThreeLeadingDiagonal player) || (@lineOfThreeTrailingDiagonal player)
      true
    else 
      false

  isWinFor: (player) ->
    if (@lineOfThreeHorizontally player) ||
       (@lineOfThreeVertically player) ||
       (@lineOfThreeDiagonally player)
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