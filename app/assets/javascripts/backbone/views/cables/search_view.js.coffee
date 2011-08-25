Leaker.Views.Cables ||= {}

class Leaker.Views.Cables.SearchView extends Backbone.View
  template: JST["backbone/templates/cables/search"]

  events:
    "submit #wikileaks-search": "search"

  initialize: () ->
    @options.cables.bind('reset', this.addAll);
    console.log 'options', @options
    $('#quickSearch').change @search

  search: (e) =>
    searching = this.$('#searching')
    searching.show()
    this.$('tbody').html('')

    e.preventDefault()
    e.stopPropagation()
    term = $('#quickSearch').val()
    url = 'http://api.leakfeed.com/v1/cables/find.json?query=' + term + '&callback=?'
    cables = @options.cables
    $.getJSON url, null, (results) ->
      searching.hide()
      cables.reset results.cables



  addAll: () =>
    @options.cables.each(this.addOne)

  addOne: (user) =>
    view = new Leaker.Views.Cables.CableView({model : user})
    this.$("tbody").append(view.render().el)

  render: =>
    $(this.el).html(this.template(cables: this.options.cables.toJSON() ))
    @addAll()

    return this

