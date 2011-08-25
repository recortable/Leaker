class Leaker.Models.User extends Backbone.Model
  paramRoot: 'user'

  defaults:
    name: null
    last_login_at: null
  
class Leaker.Collections.UsersCollection extends Backbone.Collection
  model: Leaker.Models.User
  url: '/users'