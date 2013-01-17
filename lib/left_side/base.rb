require 'yaml'

module LeftSide
  class Base

    attr_reader :sections

    def initialize
      @sections = YAML.load_file(File.join(File.dirname(__FILE__), 'section.yml'))
      define_section_method
    end

    def define_section_method
      @sections.keys.each do |section|
        define_method section do
          @sections[section]
        end

        hash = send section.to_sym
        # fetch values from hash with sub_hash(2 level at most)
        urls = hash.map{|k, v| v.is_a?(Hash) ? v.map{|kk, vv| vv} : v}.join(',').split(',')
        urls.each do |url|
          # fetch controller_name from url(producted by routes)
          controller_name = ::Rails.application.routes.recognize_path(url)[:controller].scan(/\w+$/).first.singularize
          unless respond_to? controller_name
            self.class.class_eval <<-RUBY, __FILE__, __LINE__+1
             alias #{controller_name} #{section}
            RUBY
          end
        end
      end
    end
  end
end
