API = 'http://api.leakfeed.com/v1'

class Leaker.Routers.CablesRouter extends Backbone.Router
  routes:
    "": "intro"
    "/search/:term": "search"
    "/cable/:id" : "show"
    ".*": "notfound"

  initialize: (options) ->

  intro: ->
    $("#output").html('Prueba a buscar algo...')

  search: (term) ->
    $("#output").html 'Buscando...'

    search = Leaker.backend.searchCables(term)
    $.when(search).done (cables) ->
      view = new Leaker.Views.Cables.SearchView(cables: cables, term: term)
      $("#output").html(view.render().el)

    $.when(search).fail ->
      $("#output").html 'La búsqueda ha fallado...'


  show: (reference) ->
    $("#output").html 'Abriendo cable...'
    request = Leaker.backend.findCable(reference)
    $.when(request).done (cable) ->
      view = new Leaker.Views.Cables.ShowView(model: cable)
      $("#output").html(view.render().el)
      request = Leaker.backend.findTranslation(reference)
      $.when(request).done (translation) ->
        cable.set('translation', translation)
      $.when(request).fail () ->
        console.log("Translation #{reference} missing!")
        cable.set(translationState: 'missing')

  notfound: ->
    alert('not found')

