// main.js

this.CardDragon = require('./app/card-dragon').CardDragon

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
    default :
      console.log(line);
      print('> ');
  }
});
