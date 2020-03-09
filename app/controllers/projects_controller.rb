class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create!(projects_params)

    if @project.save
      redirect_to root_url, notice: 'Проект успешно создан'
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(projects_params)
      redirect_to root_path, notice: 'Проект успешно обновлён!'
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_url, notice: 'Проект успешно удалён!'
  end

  def show
    @termins = @project.termins
  end

  private

  def projects_params
    params.require(:project).permit(:title, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
