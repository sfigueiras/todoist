class ListsController < ApplicationController
  def index
      @list = List.new
  	@lists = List.all
  end

  def show
  	Rails.application.eager_load!
  	
  	@new_task = Task.new
  	@list = List.friendly.find(params[:id])
  end

  def create
    list = List.create(list_params)

    redirect_to list_path(list)
  end

  def update
  	List.friendly.find(params[:id]).update(list_params)

  	respond_to do |format|
  		format.js { render status: 200 }
  		format.html { redirect_to list_path(params[:id]) }
  	end
  end

  def list_params
  	params.require(:list).permit(:id, :name, :slug)
  end
end
