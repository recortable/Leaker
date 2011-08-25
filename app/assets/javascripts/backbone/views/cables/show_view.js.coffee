Leaker.Views.Cables ||= {}

class Leaker.Views.Cables.ShowView extends Backbone.View
  template: JST["backbone/templates/cables/show"]

  render: ->
    $(this.el).html(this.template(this.options.model.toJSON() ))
    return this

