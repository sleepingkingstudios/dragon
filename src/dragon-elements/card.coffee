# src/dragon-elements/card.coffee

#= require dragon/card
#= require dragon-elements/elements

class Dragon.Elements.Card extends Dragon.Card
  constructor: (element) ->
    super()

    @_element = element

  ### Element ###

  getElement: () => @_element

  _element = null

  ### Name ###

  displayName: () => @getElement()
