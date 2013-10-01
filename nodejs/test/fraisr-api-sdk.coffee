FraisrAPI = require "../index"
key = "ca7c88788faae4f347ca60a3ffa1055e6fcdffbe2ceda565d75956502bd3dbea"
secret = "826d58c2627e90033cdaeeea61010af2537f520780df07f7c9cd94a027acb60ddbdc1edf1b5bcae0cb48f8c1666a8ac0ac09250e8da3360befc0071aab6b0c70"
mode = "sandbox"
url = "http://fraisr.dev:3000"
version = 1

describe "FraisrAPI", ->
    api = null
    categories = null
    causes = null
    products = null

    describe "constructor()", ->
        it "should throw an exception without key", ->
            (->
                api = new FraisrAPI
            ).should.throw()

        it "should throw an exception without secret", ->
            (->
                api = new FraisrAPI key
            ).should.throw()

        it "should throw an exception with wrong mode", ->
            (->
                api = new FraisrAPI key, secret, "wrong"
            ).should.throw()

        it "should not throw an exception", ->
            (->
                api = new FraisrAPI key, secret, mode, version, url
            ).should.not.throw()

    describe "getCategories()", ->
        it "should work", (done)->
            api.getCategories (error, _categories)->
                categories = _categories
                done error

        it "categories should be an array", ->
            categories.should.be.an.instanceOf Array

        it "categories[0] should be an instance of Category", ()->
            categories[0].should.be.an.instanceOf FraisrAPI.Category

    # describe "getCategory()", ->
    #     category = null

    #     it "should work", (done)->
    #         api.getCategory categories[0]._id, (error, _category)->
    #             category = _category
    #             done error

    #     it "category should be an instance of Category", ->
    #         category.should.be.an.instanceOf FraisrAPI.Category

    #     it "category._id should be equal to the requested one", ->
    #         category._id.should.be.equal categories[0]._id

    describe "getCauses()", ->
        it "should work", (done)->
            api.getCauses (error, _causes)->
                causes = _causes
                done error

        it "causes should be an array", ->
            causes.should.be.an.instanceOf Array

        it "causes[0] should be an instance of Cause", ()->
            causes[0].should.be.an.instanceOf FraisrAPI.Cause

    describe "getProducts()", ->
        it "should work", (done)->
            api.getProducts (error, _products)->
                products = _products
                done error

        it "products should be an array", ->
            products.should.be.an.instanceOf Array

        it "products[0] should be an instance of Product", ()->
            products[0].should.be.an.instanceOf FraisrAPI.Product

    describe "getProduct()", ->
        product = null

        it "should work", (done)->
            api.getProduct products[0]._id, (error, _product)->
                product = _product
                done error

        it "product should be an instance of Product", ->
            product.should.be.an.instanceOf FraisrAPI.Product

        it "product._id should be equal to the requested one", ->
            product._id.should.be.equal products[0]._id

    describe "getProducts() with cause 50486cb8e1a4f3713a000004 (DKMS)", ->
        it "should work", (done)->
            api.getProducts (error, _products)->
                products = _products
                done error
            , cause: "50486cb8e1a4f3713a000004"

        it "products should be an array", ->
            products.should.be.an.instanceOf Array

        it "products[0] should be an instance of Product", ()->
            products[0].should.be.an.instanceOf FraisrAPI.Product

        it "products[0].cause._id should be '50486cb8e1a4f3713a000004'", ()->
            products[0].cause._id.should.be.equal "50486cb8e1a4f3713a000004"
