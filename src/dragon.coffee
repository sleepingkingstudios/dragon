# app/dragon.coffee

SleepingKingStudios = require('./sleeping_king_studios')

Dragon = {
  greet: SleepingKingStudios.Greeter.greet

  roar: () ->
    'Roar!'
}
