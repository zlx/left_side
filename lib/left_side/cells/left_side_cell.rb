require 'cells'
require 'left_side/base'
require 'left_side/helper'

class LeftSideCell < Cell::Rails

  def base(args)
    left_side = LeftSide::Base.load
    if left_side.respond_to? args[:section]
      @sections = left_side.send args[:section]
    else
      render :nothing => true and return
    end
    append_view_path(File.dirname(__FILE__))
    render
  end
end
