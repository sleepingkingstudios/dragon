# spec/sleeping_king_studios/jasmine/describe_spec.coffee

describe 'SleepingKingStudios.Jasmine.Context', ->
  exampleGroup = null

  beforeEach ->
    exampleGroup = jasmine.currentEnv_

  describe '#context', ->
    it 'should be a function', -> expect(exampleGroup).toRespondTo('context')

    it 'should call #describe', ->
      name = 'should do something'
      fn   = ->

      spyOn(exampleGroup, 'describe')

      exampleGroup.context(name, fn)

      expect(exampleGroup.describe).toHaveBeenCalledWith(name, fn)

  describe '#fcontext', ->
    it 'should be a function', -> expect(exampleGroup).toRespondTo('fcontext')

    it 'should call #fdescribe', ->
      name = 'should do something'
      fn   = ->

      spyOn(exampleGroup, 'fdescribe')

      exampleGroup.fcontext(name, fn)

      expect(exampleGroup.fdescribe).toHaveBeenCalledWith(name, fn)

  describe '#xcontext', ->
    it 'should be a function', -> expect(exampleGroup).toRespondTo('xcontext')

    it 'should call #xdescribe', ->
      name = 'should do something'
      fn   = ->

      spyOn(exampleGroup, 'xdescribe')

      exampleGroup.xcontext(name, fn)

      expect(exampleGroup.xdescribe).toHaveBeenCalledWith(name, fn)
