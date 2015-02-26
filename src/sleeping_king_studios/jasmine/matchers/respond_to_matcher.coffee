# src/sleeping_king_studios/jasmine/matchers/respond_to_matcher.coffee

#= require sleeping_king_studios/jasmine/matchers

SleepingKingStudios.Jasmine.Matchers.RespondToMatcher = (util, customEqualityTesters) ->
  {
    compare: (actual, expected) ->
      type = typeof actual[expected]
      if 'function' == typeof actual[expected]
        return {
          pass: true,
          message: "Expected ##{expected} not to be a function"
        } # end object
      else
        unless type is 'undefined' or type is 'null'
          char = type.toLowerCase().slice(0, 1)
          if char is 'a' or char is 'e' or char is 'i' or char is 'o' or char is 'u'
            type = "an #{type}"
          else
            type = "a #{type}"

        return {
          pass: false,
          message: "Expected ##{expected} to be a function, but was #{type}"
        } # end object
  } # end matcher

beforeEach ->
  jasmine.addMatchers {
    toRespondTo: SleepingKingStudios.Jasmine.Matchers.RespondToMatcher
  } # end matchers
