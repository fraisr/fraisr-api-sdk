_ = require "underscore"

class FraisrAPI
    key: null
    secret: null
    url: null
    mode: "live"
    version: 1
    modes:
        live: "https://www.fraisr.com"
        sandbox: "https://fraisr-test.herokuapp.com"

    ###*
     * @constructor
     * @param  {String} key     API key
     * @param  {String} secret  API secret
     * @param  {String} mode    live oder sandbox mode
     * @param  {String} url     API url; Should not be necessary
    ###
    constructor: (@key, @secret, @mode = "live", @version = 1, @url = null)->
        unless @key?.length
            throw new Error "Please provide an API key."

        unless @secret?.length
            throw new Error "Please provide an API secret."

        unless @mode? and @modes[@mode]?
            throw new Error "Mode #{@mode} does not exists, please use one of the following: " + Object.keys(@modes).join(", ")

        unless @url?.length
            @url = @modes[@mode]

        @url += "/api/v#{@version}"

    ###*
     * @see Entity.list
     * @param  {Function} callback 
     * @param  {Object}   params
    ###
    getCategories: (callback, params = {})->
        Category.list @, callback, params

    ###*
     * @see Entity.lookup
     * @param  {String}   id
     * @param  {Function} callback 
     * @notImplemented
    ###
    # getCategory: (id, callback)->
    #     Category.lookup @, callback, id

    ###*
     * @see Entity.list
     * @param  {Function} callback 
     * @param  {Object}   params
    ###
    getCauses: (callback, params = {})->
        Cause.list @, callback, params

    ###*
     * @see Entity.list
     * @param  {Function} callback 
     * @param  {Object}   params
    ###
    getProducts: (callback, params = {})->
        Product.list @, callback, params

    ###*
     * @see Entity.lookup
     * @param  {String}   id
     * @param  {Function} callback 
    ###
    getProduct: (id, callback)->
        Product.lookup @, callback, id

module.exports = FraisrAPI
module.exports.Category = Category = require "./category"
module.exports.Cause = Cause = require "./cause"
module.exports.Product = Product = require "./product"