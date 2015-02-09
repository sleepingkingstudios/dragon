# src/dragon/card_list.coffee

class Dragon.CardList
  ### Cards ###

  _cards: []

  addCard: (card) => @_cards.push card

  getCards: () => @_cards

  length: () => @_cards.length
