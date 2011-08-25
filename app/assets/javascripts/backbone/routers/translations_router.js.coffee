class Leaker.Routers.TranslationsRouter extends Backbone.Router
  initialize: (options) ->
    @translations = new Leaker.Collections.TranslationsCollection
    #@translations.reset options.translations

  routes:
    "/cable/:id/new": "newTranslation"
    "cable/:id/edit": "edit"

  newTranslation: ->
    @view = new Leaker.Views.Translations.NewView(collection: @translations)
    $("#translations").html(@view.render().el)

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

