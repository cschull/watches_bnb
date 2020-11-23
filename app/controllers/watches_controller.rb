class WatchesController < ApplicationController
  before_action :find_watch, only: [:show, :edit]

  def index
    @watches = Watch.all
  end

  def show
    @watch
  end

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new(strong_params)
    if @watch.save
      redirect_to watch_path(@watch)
    else
      render :new
    end
  end

  def edit
    @watch
  end

  def update
    @watch
    if @watch.update(strong_params)
      flash[:notice] = "Created"
      redirect_to watch_path(@watch)
    else
      render :new
    end
  end

  def destroy
    @watch = Watch.destroy(strong_params)
    redirect_to dashboard_path
  end

  private

  def strong_params
    params.require(:watch).permit(:id, :description, :price)
  end

  def find_watch
    @watch = Watch.find(params[:id])
  end

end
