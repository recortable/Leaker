class Leaker.Models.Cable extends Backbone.Model
  initialize: ->
    b = this.get('body')
    this.set 'paragraphs': b.replace('¶', '<br/><br/>')


class Leaker.Collections.CablesCollection extends Backbone.Collection
  model: Leaker.Models.Cable
  url: '/cables'

