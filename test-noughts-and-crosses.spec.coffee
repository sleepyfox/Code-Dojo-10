NUM_ROWS = 3
NUM_COLUMNS = 3
EMPTY = '_'
X = 'X'
O = 'O'

gameIsFinished = (board) ->
  # no square is empty
  for row in [0..NUM_ROWS - 1]
    for column in [0..NUM_COLUMNS - 1]
      if board[row][column] is EMPTY
        return false
  return true

gameIsADraw = (board) ->
  # at this point all finished games are draws
  if (gameIsFinished(board) is true) &&
     (gameIsAWinForO(board) is false) &&
     (gameIsAWinForX(board) is false)
    true
  else
    false

# Placeholder functions
gameIsAWinForX = (board) -> false
gameIsAWinForO = (board) -> false

describe 'An empty board', ->
  board = [ [EMPTY, EMPTY, EMPTY], [EMPTY, EMPTY, EMPTY], [EMPTY, EMPTY, EMPTY] ]

  it 'should not register as finished', ->
    expect(gameIsFinished(board)).toBe false

  it 'should not register as a draw', ->
    expect(gameIsADraw(board)).toBe false

  it 'should not register as a win for X', ->
    expect(gameIsAWinForX(board)).toBe false

  it 'should not register as a win for O', ->
    expect(gameIsAWinForO(board)).toBe false

describe 'A game that has no spaces and is without a line of three', ->
  board = [ [X, O, X], [O, X, O], [O, X, O] ]
  
  it 'should register as finished', ->
    expect(gameIsFinished(board)).toBe true

  it 'should register as a draw', ->
    expect(gameIsADraw(board)).toBe true


