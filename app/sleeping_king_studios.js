// Generated by CoffeeScript 1.8.0
(function() {
  // Compiled from src/sleeping_king_studios.coffee
  var SleepingKingStudios, _;

  _ = require('underscore');

  SleepingKingStudios = {};

  // Compiled from src/sleeping_king_studios/events.coffee
  SleepingKingStudios.Events = {};

  // Compiled from src/sleeping_king_studios/events/event_dispatcher.coffee
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  SleepingKingStudios.Events.EventDispatcher = (function(_super) {
    __extends(EventDispatcher, _super);

    function EventDispatcher() {
      return EventDispatcher.__super__.constructor.apply(this, arguments);
    }

    return EventDispatcher;

  })(require('events').EventEmitter);

  // Compiled from src/sleeping_king_studios/greeter.coffee
  SleepingKingStudios.Greeter = {
    greet: function() {
      return 'Greetings, starfighter!';
    }
  };

  if (typeof exports !== 'undefined') {
    if (typeof module !== 'undefined' && module.exports) {
      exports = module.exports = SleepingKingStudios;
    }
    exports.SleepingKingStudios = SleepingKingStudios;
  } else {
    this.SleepingKingStudios = SleepingKingStudios;
  }
}).call(this);
