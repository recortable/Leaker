# Leaker

A simple tool for reading, translating and commenting wikileaks cables.
Currently is on very early stage (alpha) and hosted on
http://leaker.heroku.com


## Information for developers

### Where to start

You need knowledge in Rails 3.1 applications (asset pipeline is used,
some client code is written using coffeescript) and, obiously,
ruby skills.

Look at routes.rb is a recommended place to start. Take a look also
to the schema.rb.

For the css the excelent bootstrap library from twitter is used:
http://twitter.github.com/bootstrap

Unfortunately no documentation or tests are done (yet).

### Application structure

The application is a simple Rails 3.1 app, divied in three parts:

#### 1. Main application

This is what the user sees. It uses all the controllers inside
app/controllers folder (but not sub-folders) except ClientController.

Its a traditional web application.

#### 2. Backend application

This is the admin section. Based on this post: http://iain.nl/backends-in-rails-3-1 (reading recommended).

Uses all the controllers inside the app/controllers/backend folder
(and the same for the views: app/views/backend)

#### 3. A Backbone.js client application

It was the first attempt to build Laker, but a one-page client application (even using Backbone.js) is hand and tedious to build.

Currently is not in use. Keeped for historical and educational purposes.

### How to contribute

Please fork, commit and pull request. Contributions are more than welcomed.


## License

Not decided yet. Probably a MIT license.

