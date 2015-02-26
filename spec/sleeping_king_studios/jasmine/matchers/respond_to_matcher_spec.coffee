# spec/sleeping_king_studios/jasmine/matchers/respond_to_matcher_spec.coffee

describe 'SleepingKingStudios.Jasmine.Matchers.RespondToMatcher', ->
  actual = null

  beforeEach ->
    actual = {
      foo: -> 'foo'
      bar: -> 'bar'
      baz: 'not actually a function'
    }

  it 'exists', ->
    expect(this.SleepingKingStudios.Jasmine.Matchers.RespondToMatcher).toBeDefined()

  it 'is available on an expectation', ->
    expect(actual).toRespondTo('foo')

  it 'returns true when actual[name] is a function', ->
    expect(actual).toRespondTo('bar')

  it 'returns false when actual[name] is not a function', ->
    expect(actual).not.toRespondTo('baz')

  it 'returns false when actual[name] is undefined', ->
    expect(actual).not.toRespondTo('wibble')
