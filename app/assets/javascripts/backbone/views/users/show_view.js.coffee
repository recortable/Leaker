Leaker.Views.Users ||= {}

class Leaker.Views.Users.ShowView extends Backbone.View
  template: JST["backbone/templates/users/show"]
   
  render: ->
    $(this.el).html(this.template(this.options.model.toJSON() ))
    return this