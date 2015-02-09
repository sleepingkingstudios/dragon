// main.js

var CardDragon = this.CardDragon = require('./app/card-dragon');

// Set up the card game.
var deck = new CardDragon.Deck();
deck.shuffle();

var card = null;

card = new CardDragon.Card();
card.element = "Metal";
deck.addCard(card);

card = new CardDragon.Card();
card.element = "Water";
deck.addCard(card);

card = new CardDragon.Card();
card.element = "Wood";
deck.addCard(card);

card = new CardDragon.Card();
card.element = "Fire";
deck.addCard(card);

card = new CardDragon.Card();
card.element = "Earth";
deck.addCard(card);

deck.shuffle();

var player = new CardDragon.Elements.Player();
player.setDeck(deck);

var game = new CardDragon.Elements.Game();
game.addPlayer(player);

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

client.on('line', function(line) {
  switch(line.trim()) {
    case 'quit' :
    case 'exit' :
      client.close();
      break;
    case 'look' :
      console.log(player.getCards());
      print('> ');
      break;
    default :
      console.log(line);
      print('> ');
      break;
  }
});
