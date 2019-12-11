class StaticPagesController < ApplicationController

  def home
    @projects = Project.all
    @admins = Admin.all
  end

end
