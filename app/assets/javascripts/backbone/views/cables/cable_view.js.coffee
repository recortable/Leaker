Leaker.Views.Cables ||= {}

class Leaker.Views.Cables.CableView extends Backbone.View
  template: JST["backbone/templates/cables/cable"]

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

