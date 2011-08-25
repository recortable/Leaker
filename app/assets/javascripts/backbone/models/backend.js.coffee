API = 'http://api.leakfeed.com/v1'

class Leaker.Models.Backend
  constructor: ->
    @searchResults = new Leaker.Collections.CablesCollection()
    @searchTerm = null

  searchCables: (term) ->
    console.log "searchCables #{term}"
    dfd = $.Deferred()
    if term == @searchTerm
      dfd.resolve(@searchResults)
    else
      @searchResults = new Leaker.Collections.CablesCollection()
      @searchTerm = term
      url = "#{API}/cables/find.json?query=#{term}&callback=?"
      req = $.getJSON(url)
      req.success (results) =>
        @searchResults.reset results.cables
        dfd.resolve(@searchResults)
      req.fail ->
        dfd.reject()

    dfd.promise()

  findCable : (identifier) ->
    console.log "findCable #{identifier}"
    dfd = $.Deferred()
    url = "#{API}/cable/#{identifier}.json?callback=?"
    req = $.getJSON url
    req.success (result) ->
      cable = new Leaker.Models.Cable(result)
      dfd.resolve(cable)
    req.fail () -> dfd.reject()
    dfd.promise()

  findTranslation : (identifier) ->
    console.log "findTranslation #{identifier}"
    dfd = $.Deferred()
    t = new Leaker.Models.Translation({identifier: identifier})
    t.fetch({
      success: () -> dfd.resolve(t)
      error: () -> dfd.reject()
    })
    dfd.promise()

