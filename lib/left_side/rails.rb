require 'cells'
require File.join(File.dirname(__FILE__), 'cells', 'left_side_cell')

module LeftSide
  module Rails

    module ActionView
      # render left side
      #
      # Example:
      #
      #   <%= render_left_side :order %>
      #
      # It will render left side in this page
      #
      def render_left_side(name)
        render_cell :left_side, :base, {:section => name.singularize}
      end
    end
  end
end

ActionView::Base.class_eval do
  include ::LeftSide::Rails::ActionView
end
