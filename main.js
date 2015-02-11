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
var io = require('readline').createInterface({
  input:  process.stdin,
  output: process.stdout
});

var client = new CardDragon.Elements.Client(player);

var print = function(str) {
  process.stdout.write(str);
};

print('> ');

var match    = null;
var cardName = null;

io.on('line', function(line) {
  line = line.trim();

  switch(line.trim()) {
    case 'q' :
    case 'quit' :
    case 'exit' :
      io.close();
      return;
  }

  console.log(client.runCommand(line));

  print('> ');
});
