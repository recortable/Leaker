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
  new Leaker.Views.AppView
  router = new Leaker.Routers.CablesRouter()
  Backbone.history.start();

