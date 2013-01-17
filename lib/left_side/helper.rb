module LeftSide
  module Rails

    module Helper
      # link can be a string or a set of string
      def live_active?(link, active_class = "active")
        if link.is_a?(Array)
          link.inject(nil){|s, lin| s ||= live_active_helper?(lin, active_class)}
        elsif link.is_a?(String)
          live_active_helper?(link, active_class)
        end || ""
      end

      # use live_active? instead of
      def live_active_helper?(link, active_class)
        regexp = link["manage"].present? ? /\/manage\/([\w\/]*)/ : /\/my\/([\w\/]*)/
          current_uri = URI.unescape(link)
        expect_uri = URI.unescape(request.url)
        link_params = link.get_params
        expect_uri.scan(regexp) == current_uri.scan(regexp) && request.params.extract(link_params.keys).fixed_hash == link_params ? active_class : nil
      end
    end
  end
end

ActionView::Base.class_eval do
  include ::LeftSide::Rails::Helper
end
