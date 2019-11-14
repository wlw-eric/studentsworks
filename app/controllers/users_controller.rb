class UsersController < ApplicationController
  before_action :set_my_projects, :propal_projects, :closed_projects, :selected_projects

  private

  def set_my_projects
    @my_projects = Project.joins("LEFT JOIN works ON
      works.project_id = projects.id WHERE (projects.creator_id = #{current_user.id}
      OR works.speaker_id = #{current_user.id})")
  end

  def propal_projects
    @propal_projects = Project.where("projects.creator_id = #{current_user.id}")
  end

  def closed_projects
    @closed_projects = Project.joins("LEFT JOIN works ON
      works.project_id = projects.id WHERE projects.progress = 3
      AND works.speaker_id = #{current_user.id}")
  end

  def selected_projects
    @selected_projects = Project.joins("LEFT JOIN works ON
      works.project_id = projects.id WHERE works.speaker_id = #{current_user.id}
      AND projects.progress = 2")
  end
end
