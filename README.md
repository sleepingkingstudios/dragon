# Card Dragon

## Compilation

Compile the support libraries.

    thor assets:compile src/sleeping_king_studios --exclude src/sleeping_king_studios/jasmine --output=app/sleeping_king_studios.js --annotate

Compile the core module.

    thor assets:compile src/dragon --output=app/card-dragon.js --module=Dragon --package=CardDragon --annotate

Compile the elements module.

    thor assets:compile src/dragon-elements src/dragon --output=app/card-dragon.js --module=Dragon --package=CardDragon --annotate

## Running A Game

```
node main.js
```

## Running Specs

Compile the support libraries.

    thor assets:compile src/sleeping_king_studios/jasmine --output=app/sleeping_king_studios-jasmine.js --package=SleepingKingStudios.Jasmine --annotate
