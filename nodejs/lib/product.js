// Generated by CoffeeScript 1.4.0
var Entity, Product, _,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Entity = require("./entity");

_ = require("underscore");

module.exports = Product = (function(_super) {

  __extends(Product, _super);

  function Product() {
    return Product.__super__.constructor.apply(this, arguments);
  }

  /**
   * @type {String}
  */


  Product.resource = "products";

  return Product;

})(Entity);

/**
 * Defining the properties
*/


["_id", "name", "description", "mainImage", "imageSquare175", "imageSquare250", "imageSquare400", "location", "condition", "special_price", "price", "finalPrice", "qty", "url", "cause", "owner"].forEach(function(property) {
  return Object.defineProperty(Product.prototype, property, {
    get: function() {
      return this._data[property];
    },
    set: function(v) {
      return this._data[property] = v;
    }
  });
});
