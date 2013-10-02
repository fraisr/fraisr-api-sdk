_ = require "underscore"
request = require "superagent"
querystring = require "querystring"
Collection = require "./collection"

module.exports = class Entity
    ###*
     * @private
     * @type {Object}
    ###
    _data = null

    ###*
     * @constructor
     * @param  {Object} _data
    ###
    constructor: (@_data)->

    ###*
     * Returns an object for json serialization
     * @return {Object}
    ###
    toJSON: ->
        json = {}

        Object.keys(@_data).forEach (key)=>
            json[key] = @[key]

        json

    ###*
     * @private
     * @param  {Object}   options
     * @param  {Function} callback
    ###
    @_request: (options, callback)->
        method = (options.method ? "get").toLowerCase()
        url = options.url ? null

        unless url?.length
            throw new Error "Where should I send the request? Please give me an URL."

        if options.params?
            params = querystring.stringify options.params
            if params?.length
                url += "?#{params}"

        type = options.type ? "entity"

        r = request[method] url
        r.send options.data if options.data?
        r.auth options.key, options.secret if options.key?.length and options.secret?.length
        r.type "json"
        r.end (error, response)=>
            return callback error if error?

            switch type
                when "entity"
                    callback null, new @(response.body)
                when "collection"
                    callback null, new Collection response.body, @

    ###*
     * Resource listing
     * @param  {FraisrApi]} api
     * @param  {Function} callback
     * @param  {Object} params
     *         look at the params section in the API reference documenation
    ###
    @list: (api, callback, params)->
        params = _.defaults params,
            page: 1
            limit: 100

        options =
            url: "#{api.url}/#{@resource}"
            key: api.key
            secret: api.secret
            type: "collection"
            method: "GET"
            params: params

        @._request options, callback

    ###*
     * Resource look up
     * @param  {FraisrApi]} api
     * @param  {Function} callback
     * @param  {String} id
     *         The resource id
    ###
    @lookup: (api, callback, id)->
        options =
            url: "#{api.url}/#{@resource}/#{id}"
            key: api.key
            secret: api.secret
            type: "entity"
            method: "GET"

        @._request options, callback