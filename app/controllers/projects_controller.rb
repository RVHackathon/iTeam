class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:search]
      @projects = Project.search(params[:search]).order("created_at DESC")
    elsif params[:developer].blank?
      @projects = Project.all.order("created_at DESC")
    else
      @projects = Project.where(category_id: params[:developer]).order('created_at DESC')
    end
  end

  def show
  end

  def edit
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_path
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :category_id)
  end

  def find_project
    @project = Project.find(params[:id])
    @category = Developer.find(@project.category_id)
  end
end
