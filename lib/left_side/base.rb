require 'yaml'
require 'active_support/core_ext'

module LeftSide
  class Base

    class << self

      def set_up
        new
      end

      def init_section_method(file = File.join(File.dirname(__FILE__), 'section.yml'))
        @@sections = YAML.load_file(file)
        define_section_method
      end

      def define_section_method
        @@sections.keys.each do |section|

          send(:define_method, section) do
            @@sections[section]
          end

          # define method alias
          hash = set_up.send section.to_sym
          # fetch values from hash with sub_hash(2 level at most)
          urls = hash.map{|k, v| v.is_a?(Hash) ? v.map{|kk, vv| vv} : v}.join(',').split(',')
          urls.each do |url|
            # fetch controller_name from url(producted by routes)
            controller_name = ::Rails.application.routes.recognize_path(url)[:controller].scan(/\w+$/).first.singularize
            unless respond_to? controller_name
              send(:alias_method, controller_name, section)
            end
          end
        end
      end

    end
  end
end
