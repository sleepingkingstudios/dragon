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

  discardCard: (card) => null

  drawCard: () => @_hand.getCards().push @_deck.drawCard()

  drawCards: (count) =>
    return if count is 0

    null while @drawCard() and --count

  inspectHand: () =>
    cards = @getCards()

    if cards.length is 0
      console.log 'You have no cards in your hand.'

    for card in @getCards()
      console.log(card.displayName());

  playCard: (name) =>
    cards = @getCards()

    if cards.length is 0
      console.log 'You have no cards in your hand.'
      return false

    matchingCards = @_findCardByName(name)

    if matchingCards is null or matchingCards.length is 0
      console.log "You have no cards named #{name}."
      return false

    @_hand.removeCard(matchingCards[0])

    console.log "You played #{name}!"

  _findCardByName: (name) =>
    match = []
    cards = @getCards()

    for card in cards
      match.push card if card.displayName() is name

    match
