class Leaker.Models.Cable extends Backbone.Model
  initialize: (attributes) ->
    body = attributes['body']
    this.set('paragraphs': body.split('¶')) if body?


class Leaker.Collections.CablesCollection extends Backbone.Collection
  model: Leaker.Models.Cable
  url: '/cables'

