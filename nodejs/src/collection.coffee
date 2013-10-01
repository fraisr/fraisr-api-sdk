module.exports = (response, entity)->
    data = []
    response.data.forEach (obj)->
        data.push new entity obj
    data