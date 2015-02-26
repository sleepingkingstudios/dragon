// spec/spec_helper.js

require('coffee-script/register');

require('../app/sleeping_king_studios-jasmine');

var _ = require('underscore');

beforeAll(function() {
  this._ = _;

  this.SleepingKingStudios = require('../app/sleeping_king_studios');
});
