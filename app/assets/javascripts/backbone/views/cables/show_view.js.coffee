Leaker.Views.Cables ||= {}

class Leaker.Views.Cables.ShowView extends Backbone.View
  template: JST["backbone/templates/cables/show"]

  constructor: (options) ->
    super(options)
    @options.model.bind "change", @render
    console.log('cable binded!', @options.model)

  render: =>
    console.log('cable render')
    $(this.el).html(@template(@options.model.toJSON() ))
    return this

