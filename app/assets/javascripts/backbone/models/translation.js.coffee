class Leaker.Models.Translation extends Backbone.Model
  paramRoot: 'translation'
  urlRoot: '/translations'

  defaults:
    reference: null
    title: null
    body: null

  url: ->
    ref = this.get 'identifier'
    "#{@urlRoot}/#{ref}"

class Leaker.Collections.TranslationsCollection extends Backbone.Collection
  model: Leaker.Models.Translation
  url: '/translations'

