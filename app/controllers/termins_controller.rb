class TerminsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @termin = @project.termins.find(params[:id])

    @termins = Termin.all
  end

  def show
    @project = Project.find(params[:project_id])
  end

  def new
    @project = Project.find(params[:project_id])

    @termin = Termin.new
  end

  def edit
    @project = Project.find(params[:project_id])
    @termin = @project.termins.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])

    @termin = @project.termins.build(termin_params)
    if @termin.save
      redirect_to @project, notice: 'Термин успешно создан!'
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @termin = @project.termins.find(params[:id])

    if @termin.update(termin_params)
      redirect_to @project, notice: 'Термин успешно обновлён!'
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @termin = @project.termins.find(params[:id])

    return unless @termin.destroy!
  end

  private

  def set_termin
    @termin = @project.termins.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def termin_params
    params.require(:termin).permit([:name, :translation, :example])
  end
end
