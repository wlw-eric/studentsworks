class WorksController < ApplicationController
  before_action :set_work, only: [:create]

  def create
    @work = Work.new(speaker_id: current_user.id, project_id: @project.id)
    @project.progress = 2
    @project.save
    if @work.save!
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  private

  def set_work
    @project = Project.find(params[:project_id])
  end
end
