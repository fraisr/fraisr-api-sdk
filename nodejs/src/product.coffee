Entity = require "./entity"
_ = require "underscore"

module.exports = class Product extends Entity
    ###*
     * @type {String}
    ###
    @resource: "products"

###*
 * Defining the properties
###
["_id", "name", "description", "mainImage", "imageSquare175", "imageSquare250", "imageSquare400", "location", "condition", "special_price", "price", "finalPrice", "qty", "url", "cause", "owner"].forEach (property)->
    Object.defineProperty Product.prototype, property,
        get: ->
            @_data[property]
        set: (v)->
            @_data[property] = v
