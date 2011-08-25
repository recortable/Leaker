API = 'http://api.leakfeed.com/v1'

class Leaker.Routers.CablesRouter extends Backbone.Router
  routes:
    "": "intro"
    "/search/:term": "search"
    "/cable/:id" : "show"
    ".*": "notfound"

  initialize: (options) ->
    @cables = new Leaker.Collections.CablesCollection()

  intro: ->
    $("#output").html('Prueba a buscar algo...')

  search: (term) ->
    $("#output").html 'Buscando...'
    url = "#{API}/cables/find.json?query=#{term}&callback=?"
    console.log url
    cables = @cables
    $.getJSON url, null, (results) ->
      cables.reset results.cables
      view = new Leaker.Views.Cables.SearchView(cables: cables, term: term)
      $("#output").html(view.render().el)

  show: (id) ->
    $("#output").html 'Abriendo cable...'
    url = "#{API}/cable/#{id}.json?callback=?"
    $.getJSON url, null, (result) ->
      console.log result
      cable = new Leaker.Models.Cable(result)
      view = new Leaker.Views.Cables.ShowView(model: cable)
      $("#output").html(view.render().el)

  notfound: ->
    alert('not found')

