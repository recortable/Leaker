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


  show: (identifier) ->
    $("#output").html 'Abriendo cable...'
    request = Leaker.backend.findCable(identifier)
    $.when(request).done (cable) ->
      view = new Leaker.Views.Cables.ShowView(model: cable)
      $("#output").html(view.render().el)
      request = Leaker.backend.findTranslation(identifier)
      $.when(request).done (translation) ->
        cable.set('translation', translation)
      $.when(request).fail () ->
        console.log("Translation #{identifier} missing!")
        cable.set(translationState: 'missing')

  notfound: ->
    alert('not found')

