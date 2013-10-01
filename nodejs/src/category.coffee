Entity = require "./entity"
_ = require "underscore"

module.exports = class Category extends Entity
    ###*
     * @type {String}
    ###
    @resource: "categories"

###*
 * Defining the properties
###
["_id", "name", "slug", "parent", "label"].forEach (property)->
    Object.defineProperty Category.prototype, property,
        get: ->
            @_data[property]
        set: (v)->
            @_data[property] = v
