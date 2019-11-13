class WorksController < ApplicationController
  before_action :set_work, only: [:create, :destroy]

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

  def destroy
    @work = Work.where("project_id = #{params[:project_id]} AND works.speaker_id = #{params[:id]}")
    @work.first.destroy
    @project.progress = 1
    @project.save
    redirect_to project_path(@project)
  end

  private

  def set_work
    @project = Project.find(params[:project_id])
  end
end
