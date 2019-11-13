class UsersController < ApplicationController
  def my_projects
    @my_projects = Project.joins("LEFT JOIN works ON works.project_id = projects.id WHERE projects.creator_id = #{current_user.id} OR works.speaker_id = #{current_user.id}")
  end
end
