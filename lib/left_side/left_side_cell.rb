require 'cells'

module LeftSide
  class LeftSideCell < Cell::Rails
    def base(args)
      base = LeftSide::Base.new
      if base.respond_to? args[:section]
        @sections = base.send args[:section]
      else
        render :nothing => true and return
      end
      render
    end
  end
end