class StaticPagesController < ApplicationController

  def home
    @projects = Project.where(published: true)
    @admins = Admin.all
  end

end
