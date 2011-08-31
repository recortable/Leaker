source 'http://rubygems.org'

gem 'rails', '3.1.0.rc6'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3'
end

# Required for Heroku deployment
group :production do
  gem 'pg'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

gem 'jquery-rails'


# Recommended reading: http://iain.nl/backends-in-rails-3-1
gem 'rails-backbone' # Backbone client - currently not used
gem 'omniauth' # Twitter authentication
gem 'inherited_resources' # Backend controllers
gem 'kaminari' # Pagination
gem 'has_scope' # Pagination (with kaminari)
gem 'responders' # Flash and http cache responders
gem 'simple_form' # Easy forms
gem 'acts-as-taggable-on', '~>2.1.0' # Tags
gem 'redcarpet' # Markup for comments

#gem 'sishen-rtranslate'


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

