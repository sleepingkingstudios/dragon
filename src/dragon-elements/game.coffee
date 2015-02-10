# src/dragon-elements/game.coffee

#= require dragon/game
#= require dragon-elements/elements

class Dragon.Elements.Game extends Dragon.Game
  endTurn: () => null

  playCard: (player, card) =>
    playerIndex = @getPlayers.indexOf(player)

    console.log 'Elements.Game#playCard(), playerIndex = ' + playerIndex
    console.log card
