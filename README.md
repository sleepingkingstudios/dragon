# Card Dragon

## Compilation

Compile the core module.

    thor assets:compile src/dragon --output=app/card-dragon.js --module=Dragon --package=CardDragon --annotate

Compile the elements module.

    thor assets:compile src/dragon-elements src/dragon --output=app/card-dragon.js --module=Dragon --package=CardDragon --annotate

Compile the monsters module.

    thor assets:compile src/dragon-monsters src/dragon --output=app/card-dragon.js --module=Dragon --package=CardDragon --annotate

## Running A Game

```
node main.js
```
