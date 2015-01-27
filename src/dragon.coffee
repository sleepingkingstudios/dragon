# app/dragon.coffee

SleepingKingStudios = require('./sleeping_king_studios').SleepingKingStudios

Dragon = {
  greet: SleepingKingStudios.Greeter.greet

  roar: () ->
    'Roar!'
}
