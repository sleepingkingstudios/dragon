# src/dragon/card.coffee

#= require dragon

class Dragon.Game
  start: ()=> null

  ### Players ###

  addPlayer: (player) =>
    @_players.push(player)
    player.game = @

  getPlayers: () => @_players

  _players: []
