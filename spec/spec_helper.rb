ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] = File.expand_path("../dummy", __FILE__)

require File.expand_path("../dummy/config/environment", __FILE__)

require 'rspec/rails'
require 'capybara/rails'
require 'left_side'

RSpec.configure do |config|

  config.include Rails.application.routes.url_helpers

end
