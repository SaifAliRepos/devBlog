# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
#require "will_paginate"

config.action_mailer.default_url_options = { :host => 'https://fierce-ravine-71442.herokuapp.com' }
