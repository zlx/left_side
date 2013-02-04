require 'cells'

class LeftSideCell < Cell::Rails

  def base(args)
    LeftSide::Base.init_section_method(File.join(::Rails.root, 'config', 'left_side', 'section.yml'))
    if LeftSide::Base.new.respond_to? args[:section]
      @sections = LeftSide::Base.new.send args[:section]
    else
      render :nothing => true and return
    end
    append_view_path(File.dirname(__FILE__))
    render
  end
end
