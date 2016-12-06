class TasksController < ApplicationController
	def create
		List.friendly.find(params[:list_id]).tasks << Task.create(task_params)
		redirect_to list_path(params[:list_id])
	end

	def update
		Task.update(params[:id], task_params)
		respond_to do |format|	
			format.js { render status: 200 }
			format.html { redirect_to list_path(params[:list_id]) }
		end
	end

	def destroy
		Task.destroy(params[:id])
		redirect_to list_path(params[:list_id])
	end	
	
	private

	def task_params
    		params.require(:task).permit(:id, :description, :state, :progress, :start_date, :end_date, :type)
	end
end
