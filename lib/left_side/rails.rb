require 'cells'

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
        ::Cell::Rails.render_cell_for(:left_side, :base, controller, {:section => name})
      end
    end
  end
end

ActionView::Base.class_eval do
  include ::LeftSide::Rails::ActionView
end
