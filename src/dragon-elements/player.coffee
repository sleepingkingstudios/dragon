# src/dragon-elements/player.coffee

#= require dragon/player
#= require dragon-elements/elements

class Dragon.Elements.Player extends Dragon.Player
  setup: () =>
    @drawCards(5)

  ### Deck ###

  _deck: null

  getDeck: () => @_deck

  setDeck: (deck) => @_deck = deck

  ### Hand ###

  drawCard: () => _hand.push _deck.drawCard()

  drawCards: (count) =>
    return if count is 0

    null while --count and @drawCard()
