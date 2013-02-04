module LeftSide
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "copy config file"
      source_root File.expand_path('../templates', __FILE__)

      def copy_config
        copy_file "config/section.yml.example", "config/left_side/section.yml"
      end

    end
  end
end
