class Leaker.Routers.TranslationsRouter extends Backbone.Router
  initialize: (options) ->
    @translations = new Leaker.Collections.TranslationsCollection
    #@translations.reset options.translations

  routes:
    "/cable/:id/newTranslation": "newTranslation"
    "cable/:id/edit": "edit"

  newTranslation: (identifier) ->
    request = Leaker.backend.findCable(identifier)

    request.done (cable) ->
      t = new Leaker.Models.Translation(
        identifier: cable.get('identifier')
        original: cable.get('body')
      )
      @view = new Leaker.Views.Translations.NewView(model: t)
      $("#output").html(@view.render().el)

  index: ->
    @view = new Leaker.Views.Translations.IndexView(translations: @translations)
    $("#translations").html(@view.render().el)

  show: (id) ->
    translation = @translations.get(id)

    @view = new Leaker.Views.Translations.ShowView(model: translation)
    $("#translations").html(@view.render().el)

  edit: (id) ->
    translation = @translations.get(id)

    @view = new Leaker.Views.Translations.EditView(model: translation)
    $("#translations").html(@view.render().el)

