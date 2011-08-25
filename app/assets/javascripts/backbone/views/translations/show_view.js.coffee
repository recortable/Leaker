Leaker.Views.Translations ||= {}

class Leaker.Views.Translations.ShowView extends Backbone.View
  template: JST["backbone/templates/translations/show"]
   
  render: ->
    $(this.el).html(this.template(this.options.model.toJSON() ))
    return this