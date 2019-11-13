class UsersController < ApplicationController
  def my_projects
    @my_projects = Project.where(creator_id: current_user.id)
    p @my_projects
  end
end
