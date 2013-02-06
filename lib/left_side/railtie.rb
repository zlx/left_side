require 'rails/railtie'

module LeftSide
  class Railtie < ::Rails::Railtie
    initializer "left_side.append_url_helper" do |app|
      LeftSide::Base.class_eval do
        include app.routes.url_helpers
      end
    end
  end
end
