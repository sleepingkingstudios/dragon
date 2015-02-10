# src/dragon/card_list.coffee

class Dragon.CardList
  constructor: () ->
    @_cards = []

  ### Cards ###

  _cards: null

  addCard: (card) => @_cards.push card

  getCards: () => @_cards

  length: () => @_cards.length

  removeCard: (card) =>
    index = @_cards.indexOf(card)

    @_cards.splice(index, 1)
