#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Leaker =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}




$ ->
  Leaker.backend = new Leaker.Models.Backend
  Leaker.appView = new Leaker.Views.AppView
  Leaker.routers = []
  Leaker.routers.cables = new Leaker.Routers.CablesRouter()
  Leaker.routers.translations = new Leaker.Routers.TranslationsRouter()
  Backbone.history.start();

