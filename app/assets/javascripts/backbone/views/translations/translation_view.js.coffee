Leaker.Views.Translations ||= {}

class Leaker.Views.Translations.TranslationView extends Backbone.View
  template: JST["backbone/templates/translations/translation"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "tr"
  
  destroy: () ->
    @options.model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(this.template(this.options.model.toJSON() ))    
    return this