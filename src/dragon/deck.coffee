# src/dragon/card.coffee

#= require dragon/card_list

class Dragon.Deck extends Dragon.CardList
  ### Cards ###

  drawCard: () => @_cards.pop()

  shuffle: () =>
    i = @_cards.length

    return if i == 0

    while --i
      j = Math.floor(Math.random() * (i+1))
      u = @_cards[i]
      v = @_cards[j]
      @_cards[i] = v
      @_cards[j] = u
