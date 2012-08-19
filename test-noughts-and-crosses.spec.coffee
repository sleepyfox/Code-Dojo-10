NUM_ROWS = 3
NUM_COLUMNS = 3
EMPTY = '_'

describe 'An empty board', ->
  board = []

  beforeEach = ->
    board = ((EMPTY for row in [1..3]) for column in [1..3])
    
  it 'should not register as a draw', ->
    gameIsADraw = (board) ->
      false
    expect(gameIsADraw(board)).toBe false

  it 'should not register as a win for X', ->
    gameIsAWinForX = (board) ->
      false
    expect(gameIsAWinForX(board)).toBe false

  it 'should not register as a win for O', ->
    gameIsAWinForO = (board) ->
      false
    expect(gameIsAWinForO(board)).toBe false

describe 'A game that has no spaces and is without a line of three', ->
  it 'should register as finished', ->
    X = 'X'
    O = 'O'
    board = [ [X, O, X], [O, X, O], [O, X, O] ]
    gameIsFinished = (board) ->
      # no square is empty
      finished = true      
      for row in [0..NUM_ROWS - 1]
        for column in [0..NUM_COLUMNS - 1]
          finished = finished && board[row][column] isnt EMPTY
      return finished
    expect(gameIsFinished(board)).toBe true

