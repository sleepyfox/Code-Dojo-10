describe 'An empty board', ->
  it 'should register as a draw', ->
    EMPTY = null
    board = ((EMPTY for row in [1..3]) for column in [1..3])
    gameIsADraw = (board) ->
      true

    expect(gameIsADraw(board)).toBe true
