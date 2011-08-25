class Leaker.Routers.CablesRouter extends Backbone.Router
  initialize: (options) ->
    @cables = new Leaker.Collections.CablesCollection()


  routes:
    ".*": "search"

  search: ->
    @view = new Leaker.Views.Cables.SearchView(cables: @cables)
    $("#cables").html(@view.render().el)

