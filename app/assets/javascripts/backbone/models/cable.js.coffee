class Leaker.Models.Cable extends Backbone.Model


class Leaker.Collections.CablesCollection extends Backbone.Collection
  model: Leaker.Models.Cable
  url: '/cables'

