class TasksController < ApplicationController
	def create
		task = Task.create(task_params)
		task.progress = 0 if (task_params[:type].eql? "LongTask")
		
		List.friendly.find(params[:list_id]).tasks << task
		
		redirect_to list_path(params[:list_id])
	end

	def update
		Task.find(params[:id]).update(task_params)

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
    		params.require(:task).permit(:id, :description, :state, :priority, :progress, :start_date, :end_date, :type)
	end
end
