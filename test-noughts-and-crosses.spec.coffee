describe 'An empty board', ->
  board = []

  beforeEach = ->
    EMPTY = '_'
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
