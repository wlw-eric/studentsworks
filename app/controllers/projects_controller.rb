class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :update_progress]

  # GET /projects
  # GET /projects.json
  def index

    # @sql = "Projects.name ILIKE '#{'%'+params[:name]+'%'}' " if params[:name].present?
    @sql = params[:name].present? ? "Projects.name ILIKE '#{'%'+params[:name]+'%'}' " : "Projects.name ILIKE '%' "
    @sql += "and Projects.category ILIKE '#{'%'+params[:category]+'%'}' " if params[:category].present?
    @sql += "OR Projects.description ILIKE '#{'%'+params[:category]+'%'}' " if params[:category].present?
    # @sql += "GROUP BY category"
    @projects = Project.where(@sql)
    @count = @projects.count
    @count_tt = Project.all.count

  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.creator = current_user

    respond_to do |format|
      if @project.save!
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.update(project_params)
  end

  def update_progress
    @project.progress = 3
    @project.save
    redirect_to my_project_path
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :objective, :progress, :picture, :category, :creator)
    end
end
