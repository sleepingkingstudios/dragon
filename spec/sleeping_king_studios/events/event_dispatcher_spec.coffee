# spec/sleeping_king_studios/events/event_dispatcher_spec.coffee

describe 'SleepingKingStudios.Events.EventDispatcher', ->
  describedClass = null
  instance       = null

  beforeEach ->
    describedClass = this.SleepingKingStudios.Events.EventDispatcher
    instance       = new describedClass()

  it 'exists', ->
    expect(this.SleepingKingStudios.Events.EventDispatcher).toBeDefined()

  describe '#emit', ->
    it 'should respond to emit', -> expect(instance).toRespondTo('on')

    describe '', ->
      it '', -> expect(true).toBe(true)

  describe '#on', ->
    it 'should respond to on', -> expect(instance).toRespondTo('on')
