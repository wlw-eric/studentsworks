class UsersController < ApplicationController
  def my_projects
    @my_projects = Project.joins("LEFT JOIN works ON works.project_id = projects.id")
  end
end
