source :rubygems

gem 'rails'
gem 'rake'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'devise' # Devise must be required before RailsAdmin
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'ckeditor', :git => 'git://github.com/galetahub/ckeditor.git', :branch => 'master'
gem "paperclip"
gem "acts_as_tree"
gem "cells"
gem "haml"
#gem 'formtastic'
gem 'formtastic-bootstrap'
gem 'bootstrap-sass', '~> 1.4.3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'


# Deploy with Capistrano
# gem 'capistrano'

group :development do
  #gem 'therubyracer'
# To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'
#  gem 'ruby-debug-base19'
#  gem 'ruby-debug-ide19'
  gem 'ruby-debug-ide', '= 0.4.17.beta5'
  gem 'mongrel', '>= 1.2.0.pre2' #for ruby v1.9.2
end
group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

group :production do
# Use unicorn as the web server
gem 'unicorn'
end
