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

describe 'An empty board', ->
  game = new Game

  it 'should not register as finished', ->
    expect(game.isFinished()).toBe false

  it 'should not register as a draw', ->
    expect(game.isDraw()).toBe false

  it 'should not register as a win for X', ->
    expect(game.isWinForX()).toBe false

  it 'should not register as a win for O', ->
    expect(game.isWinForO()).toBe false

describe 'A game that has no spaces and is without a line of three', -> 
  game = new Game([ [X, O, X], [O, X, O], [O, X, O] ])

  it 'should register as finished', ->
    expect(game.isFinished()).toBe true

  it 'should register as a draw', ->
    expect(game.isDraw()).toBe true


