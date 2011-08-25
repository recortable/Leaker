Leaker.Views.Users ||= {}

class Leaker.Views.Users.UserView extends Backbone.View
  template: JST["backbone/templates/users/user"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "tr"
  
  destroy: () ->
    @options.model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(this.template(this.options.model.toJSON() ))    
    return this