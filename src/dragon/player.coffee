# src/dragon/card.coffee

#= require dragon/card_list

class Dragon.Player
  constructor: () ->
    @_hand = new Dragon.CardList()

  ### Game ###

  _game: null

  getGame: () => @_game

  setGame: (game) => @_game = game

  ### Hand ###

  _hand: null

  getCards: () => @_hand.getCards()
