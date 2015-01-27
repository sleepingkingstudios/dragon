// Generated by CoffeeScript 1.8.0
(function() {
  var Dragon, SleepingKingStudios, exports;

  SleepingKingStudios = require('./sleeping_king_studios').SleepingKingStudios;

  Dragon = {
    greet: SleepingKingStudios.Greeter.greet,
    roar: function() {
      return 'Roar!';
    }
  };

  if (typeof exports !== 'undefined') {
    if (typeof module !== 'undefined' && module.exports) {
      exports = module.exports = Dragon;
    }
    exports.Dragon = Dragon;
  } else {
    this.Dragon = Dragon;
  }

}).call(this);
