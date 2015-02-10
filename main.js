// main.js

var _ = require('underscore');

var CardDragon = this.CardDragon = require('./app/card-dragon');

// Set up the card game.
var generateDeck = function() {
  var deck = new CardDragon.Deck();
  var card = null;

  card = new CardDragon.Elements.Card("Metal");
  deck.addCard(card);

  card = new CardDragon.Elements.Card("Water");
  deck.addCard(card);

  card = new CardDragon.Elements.Card("Wood");
  deck.addCard(card);

  card = new CardDragon.Elements.Card("Fire");
  deck.addCard(card);

  card = new CardDragon.Elements.Card("Earth");
  deck.addCard(card);

  deck.shuffle();

  return deck;
}

var player = new CardDragon.Elements.Player();
player.setDeck(generateDeck());

var opponent = new CardDragon.Elements.Player();
opponent.setDeck(generateDeck());

var game = new CardDragon.Elements.Game();
game.addPlayer(player);
game.addPlayer(opponent);

game.start();

// Set up the client.
var client = require('readline').createInterface({
  input:  process.stdin,
  output: process.stdout
});

var print = function(str) {
  process.stdout.write(str);
};

print('> ');

var match    = null;
var cardName = null;

client.on('line', function(line) {
  switch(line.trim()) {
    case 'q' :
    case 'quit' :
    case 'exit' :
      client.close();
      break;
    case 'look' :
      player.inspectHand();
      print('> ');
      break;
    case 'peek' :
      var cards = _.map(player.getDeck().getCards(), function(card) { return card.displayName(); });
      console.log(cards);
      print('> ');
      break;
    default :
      if(match = line.match(/^play\s+([A-Za-z ]+)/)) {
        cardName = match[1]
        player.playCard(cardName);
      }

      print('> ');
      break;
  }
});
