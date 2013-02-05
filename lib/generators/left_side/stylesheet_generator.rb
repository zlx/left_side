module LeftSide
  module Generators
    class StylesheetGenerator < ::Rails::Generators::Base
      desc "copy stylesheet file"
      source_root File.expand_path("../../../assets", __FILE__)

      def copy_stylesheet
        copy_file "stylesheets/left-side.css.scss", "assets/stylesheets/left-side.css.scss"
      end

    end
  end
end
