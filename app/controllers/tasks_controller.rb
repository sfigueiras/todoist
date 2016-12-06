class TasksController < ApplicationController
	def create
		List.friendly.find(params[:list_id]).tasks << Task.create(task_params)
		redirect_to list_path(params[:list_id])
	end

	def update
		Task.update(params[:id], task_params)
		redirect_to list_path(params[:list_id])
	end

	def destroy
		Task.destroy(params[:id])
		redirect_to list_path(params[:list_id])
	end	
	
	private

	def task_params
    		params.require(:task).permit(:id, :description, :state, :progress, :start_date, :end_date)
	end
end
