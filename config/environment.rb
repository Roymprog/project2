# Load the rails application
require File.expand_path('../application', __FILE__)

require 'will_paginate'
require 'will_paginate/active_record'

# Initialize the rails application
Project2::Application.initialize!
Rails.logger = Logger.new(STDOUT)