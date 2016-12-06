class ListsController < ApplicationController
  def index
  	@lists = List.all
  end

  def show
  	Rails.application.eager_load!
  	
  	@new_task = Task.new
  	@list = List.friendly.find(params[:id])
  end
end
