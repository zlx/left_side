require 'uri'
require 'left_side/core_ext'

module LeftSide
  module Rails

    module Helper
      def live_active?(link, active_class = "active")
        Array(link).inject(nil){|s, lin| s ||= live_active_helper?(lin, active_class)}
      end

      def live_active_helper?(link, active_class)
        url_match?(link) ? active_class : nil
      end

      private

      def url_match?(link)
        base_url_match?(link) && params_match?(link)
      end

      def base_url_match?(link)
        expect_hash = recognize_path(link)
        expect_hash[:controller] == request[:controller] && expect_hash[:action] == request[:action]
      end

      def params_match?(link)
        link_params = link.get_params
        request.params.extract(link_params.keys).fixed_hash == link_params
      end

      def unescape(url)
        URI.unescape(url)
      end

      def recognize_path(link)
        ::Rails.application.routes.recognize_path(unescape(link))
      end
    end
  end
end

ActionView::Base.class_eval do
  include ::LeftSide::Rails::Helper
end
