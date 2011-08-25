Leaker.Views.Cables ||= {}

class Leaker.Views.Cables.SearchView extends Backbone.View
  template: JST["backbone/templates/cables/search"]

  initialize: () ->
    @options.cables.bind('reset', this.addAll);

  searching: (running) =>
    spinner = this.$('#searching')
    if running then spinner.show() else spinner.hide()

    #this.$('tbody').html('')

  addAll: () =>
    @options.cables.each(this.addOne)

  addOne: (user) =>
    view = new Leaker.Views.Cables.CableView({model : user})
    this.$("tbody").append(view.render().el)

  render: =>
    $(this.el).html(this.template(cables: this.options.cables.toJSON() ))
    this.$('.term').html("Buscar '#{@options.term}'")
    @addAll()

    return this

