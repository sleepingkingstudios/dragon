# src/sleeping_king_studios/jasmine/describe.coffee

#= require sleeping_king_studios/jasmine

SleepingKingStudios.Jasmine._originalEnv = jasmine.Env

SleepingKingStudios.Jasmine.Context = {
  context:  describe
  fcontext: fdescribe
  xcontext: xdescribe
}

_.extend jasmine.currentEnv_, SleepingKingStudios.Jasmine.Context

jasmine.Env = () ->
  _.extend(new SleepingKingStudios.Jasmine._originalEnv(), SleepingKingStudios.Jasmine.Context)
