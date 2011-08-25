class Leaker.Routers.CablesRouter extends Backbone.Router

  routes:
    "": "intro"
    "/search/:term": "search"
    ".*": "notfound"

  initialize: (options) ->
    @cables = new Leaker.Collections.CablesCollection()

  intro: ->
    $("#cables").html('Prueba a buscar...')

  search: (term) ->
    view = new Leaker.Views.Cables.SearchView(cables: @cables, term: term)
    $("#cables").html(view.render().el)
    view.searching true
    url = 'http://api.leakfeed.com/v1/cables/find.json?query=' + term + '&callback=?'
    console.log url
    cables = @cables
    $.getJSON url, null, (results) ->
      view.searching false
      cables.reset results.cables

  notfound: ->
    alert('not found')

