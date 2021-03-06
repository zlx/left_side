require 'yaml'
require 'left_side/core_ext'

module LeftSide
  class Base

    include Singleton
    class << self

      def load
        load_config
        process_url_helper
        define_section_method
        instance
      end

      private

      def load_config
        @@sections ||= YAML.load_file(File.join(::Rails.root, 'config', 'left_side', 'section.yml'))
      end

      def process_url_helper
        @@sections.process_each_value do |url|
          if url =~ /(.*_path)\(?([^()]*)\)?/ && instance.respond_to?($1)
            instance.send($1, eval("{" + $2.to_s + "}"))
          else
            url
          end
        end
      end

      def define_section_method
        @@sections.keys.each do |section|
          create_section_method(section)

          define_method_alias(section)
        end
      end

      def create_section_method(name)
        send(:define_method, name){ @@sections[name] }
      end

      def define_method_alias(section)
        fetch_section_controller_names(section).each do |controller_name|
          send(:alias_method, controller_name, section) unless instance.respond_to? controller_name
        end
      end

      def fetch_section_controller_names(section)
        instance.send(section.to_sym).fetch_values.map{|url| controller_name(url)}
      end

      def controller_name(url)
        ::Rails.application.routes.recognize_path(url)[:controller].scan(/\w+$/).first.singularize
      end

    end
  end
end
