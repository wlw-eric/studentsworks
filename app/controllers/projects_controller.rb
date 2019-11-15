class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :update_progress]

  # GET /projects
  # GET /projects.json
  def index

    # @sql = "Projects.name ILIKE '#{'%'+params[:name]+'%'}' " if params[:name].present?
    @sql = params[:name].present? ? "Projects.name ILIKE '#{'%'+params[:name]+'%'}' " : "Projects.name ILIKE '%' "
    @sql += "OR Projects.description ILIKE '#{'%'+params[:name]+'%'}' " if params[:name].present?

    @sql += "and Projects.category ILIKE '#{'%'+params[:categorysdigital]+'%'}' " if params[:categorysdigital].present?
    if params[:categorysdigital].present?
      @sql += "or Projects.category ILIKE '#{'%'+params[:categorysmarketing]+'%'}' " if params[:categorysmarketing].present?
    else
      @sql += "And Projects.category ILIKE '#{'%'+params[:categorysmarketing]+'%'}' " if params[:categorysmarketing].present?
    end

    if params[:categorysdigital].present? || params[:categorysmarketing].present?
      @sql += "or Projects.category ILIKE '#{'%'+params[:categorysdesign]+'%'}' " if params[:categorysdesign].present?
    else
      @sql += "And Projects.category ILIKE '#{'%'+params[:categorysdesign]+'%'}' " if params[:categorysdesign].present?
    end

    @sql += "and Projects.progress = #{params[:progresspropose].to_i} " if params[:progresspropose].present?
    if params[:progresspropose].present?
    @sql += "or Projects.progress = #{params[:progressselected].to_i} " if params[:progressselected].present?
    else
    @sql += "and Projects.progress = #{params[:progressselected].to_i} " if params[:progressselected].present?
    end

    if params[:progressselected].present?
    @sql += "or Projects.progress = #{params[:progressclose].to_i} " if params[:progressclose].present?
    else
    @sql += "and Projects.progress = #{params[:progressclose].to_i} " if params[:progressclose].present?
    end

    # @sql += "ORDER progress"
    @projects = Project.where(@sql).order(:progress)
    @count = @projects.count
    @count_tt = Project.count
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
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully update.' }
      else
        format.html { render :edit }
      end
    end
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
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :objective, :progress, :picture, :picture_cache, :category, :creator)
    end
end
