class AdminController < ApplicationController
	layout "custom_layouts/adminlayout"
  def home
    @boards=Board.count
    @groups=Group.count
    @courses=Course.count
    @teachers = Teacher.count
  end
end
