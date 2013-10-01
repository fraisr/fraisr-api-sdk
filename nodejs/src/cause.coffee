Entity = require "./entity"
_ = require "underscore"

module.exports = class Cause extends Entity
    ###*
     * @type {String}
    ###
    @resource: "causes"

###*
 * Defining the properties
###
["_id", "name", "description", "restrictions", "imageSquare", "url"].forEach (property)->
    Object.defineProperty Cause.prototype, property,
        get: ->
            @_data[property]
        set: (v)->
            @_data[property] = v
