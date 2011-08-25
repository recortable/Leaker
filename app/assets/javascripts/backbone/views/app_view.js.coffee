
class Leaker.Views.AppView extends Backbone.View

  initialize: () ->
    $('#quickSearch').change (e) ->
      e.preventDefault()
      e.stopPropagation()
      Backbone.history.navigate("/search/#{$(this).val()}")
      false

