# src/dragon-elements/client.coffee

#= require dragon-elements/elements

class Dragon.Elements.Client
  constructor: (player) ->
    @_player = player

  ### Player ###

  _player: null

  getPlayer: () => @_player

  ### Commands ###

  runCommand: (command) =>
    player = @getPlayer()

    if command == 'look'
      return player.inspectHand()

    if match = command.match(/^play\s+([A-Za-z ]+)/)
      return player.playCard(match[1]);
