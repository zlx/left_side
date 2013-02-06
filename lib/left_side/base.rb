require 'yaml'
require 'left_side/core_ext'

module LeftSide
  class Base

    include Singleton
    class << self

      def load
        @@sections ||= YAML.load_file(File.join(::Rails.root, 'config', 'left_side', 'section.yml'))
        process_url_helper
        define_section_method
        instance
      end

      private

      def process_url_helper
        @@sections.process_each_value{|url| instance.respond_to?(url) ? instance.send(url) : url}
      end

      def create_section_method(name)
        send(:define_method, name){ @@sections[name] }
      end

      def controller_name(url)
        ::Rails.application.routes.recognize_path(instance.respond_to?(url) ? instance.send(url) : url)[:controller].scan(/\w+$/).first.singularize
      end

      def fetch_section_controller_names(section)
        instance.send(section.to_sym).fetch_values.map{|url| controller_name(url)}
      end

      def define_method_alias(section)
        fetch_section_controller_names(section).each do |controller_name|
          send(:alias_method, controller_name, section) unless instance.respond_to? controller_name
        end
      end

      def define_section_method
        @@sections.keys.each do |section|
          create_section_method(section)

          define_method_alias(section)
        end
      end

    end
  end
end
