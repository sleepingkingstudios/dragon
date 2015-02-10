# src/dragon/card.coffee

#= require dragon

class Dragon.Game
  _setup: false

  setup: ()=>
    return if _setup

    for player in @getPlayers()
      player.drawCards(5);

    _setup = true

  start: ()=> @setup()

  ### Players ###

  addPlayer: (player) =>
    @_players.push(player)
    player.game = @

  getPlayers: () => @_players

  _players: []
