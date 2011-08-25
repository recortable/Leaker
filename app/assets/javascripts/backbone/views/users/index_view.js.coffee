Leaker.Views.Users ||= {}

class Leaker.Views.Users.IndexView extends Backbone.View
  template: JST["backbone/templates/users/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render');
    
    @options.users.bind('reset', this.addAll);
   
  addAll: () ->
    @options.users.each(this.addOne)
  
  addOne: (user) ->
    view = new Leaker.Views.Users.UserView({model : user})
    this.$("tbody").append(view.render().el)
       
  render: ->
    $(this.el).html(this.template(users: this.options.users.toJSON() ))
    @addAll()
    
    return this