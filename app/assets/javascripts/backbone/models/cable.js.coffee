class Leaker.Models.Cable extends Backbone.Model
  initialize: (attributes) ->
    body = attributes['body']
    console.log body
    this.set('paragraphs': body.replace('¶', '<br/><br/>')) if body?


class Leaker.Collections.CablesCollection extends Backbone.Collection
  model: Leaker.Models.Cable
  url: '/cables'

