Leaker.Views.Translations ||= {}

class Leaker.Views.Translations.IndexView extends Backbone.View
  template: JST["backbone/templates/translations/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render');
    
    @options.translations.bind('reset', this.addAll);
   
  addAll: () ->
    @options.translations.each(this.addOne)
  
  addOne: (translation) ->
    view = new Leaker.Views.Translations.TranslationView({model : translation})
    this.$("tbody").append(view.render().el)
       
  render: ->
    $(this.el).html(this.template(translations: this.options.translations.toJSON() ))
    @addAll()
    
    return this