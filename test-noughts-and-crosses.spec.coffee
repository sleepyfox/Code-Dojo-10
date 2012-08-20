nac = require('./noughts-and-crosses')
[Game, X, O, EMPTY] = [nac.Game, nac.X, nac.O, nac.EMPTY]

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

describe 'A game that has an early vertical line of three noughts', ->
  game = new Game([ [X, O, X], [X, O, EMPTY], [EMPTY, O, EMPTY] ])

  it 'should not register as a draw', ->
    expect(game.isDraw()).toBe false 

  it 'should not register as a win for X', ->
    expect(game.isWinForX()).toBe false

  it 'should register as a win for O', ->
    expect(game.isWinForO()).toBe true

describe 'A game that has an early horizontal line of three noughts', ->
  game = new Game([ [O, O, O], [X, X, EMPTY], [EMPTY, X, EMPTY] ])

  it 'should not register as a draw', ->
    expect(game.isDraw()).toBe false 

  it 'should not register as a win for X', ->
    expect(game.isWinForX()).toBe false

  it 'should register as a win for O', ->
    expect(game.isWinForO()).toBe true

describe 'A game that has an early diagonal line of three noughts', ->
  game = new Game([ [O, EMPTY, X], [X, O, EMPTY], [EMPTY, X, O] ])

  it 'should not register as a draw', ->
    expect(game.isDraw()).toBe false 

  it 'should not register as a win for X', ->
    expect(game.isWinForX()).toBe false

  it 'should register as a win for O', ->
    expect(game.isWinForO()).toBe true

describe 'A game that has an early vertical line of three crosses', ->
  game = new Game([ [O, EMPTY, X], [EMPTY, O, X], [EMPTY, O, X] ])

  it 'should not register as a draw', ->
    expect(game.isDraw()).toBe false 

  it 'should register as a win for X', ->
    expect(game.isWinForX()).toBe true

  it 'should not register as a win for O', ->
    expect(game.isWinForO()).toBe false

describe 'A game that has an early horizontal line of three crosses', ->
  game = new Game([ [O, X, O], [O, O, EMPTY], [X, X, X] ])

  it 'should not register as a draw', ->
    expect(game.isDraw()).toBe false 

  it 'should register as a win for X', ->
    expect(game.isWinForX()).toBe true

  it 'should not register as a win for O', ->
    expect(game.isWinForO()).toBe false

