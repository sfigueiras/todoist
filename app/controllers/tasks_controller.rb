class TasksController < ApplicationController
	def create
		task = Task.create(task_params)
		task.progress = 0 if (task_params[:type].eql? "LongTask")
		
		List.friendly.find(params[:list_id]).tasks << task
		
		redirect_to list_path(params[:list_id])
	end

	def update
		task = Task.find(params[:id])
		task.update(task_params)

		respond_to do |format|	
			format.js { render status: 200 }
			format.html do
				flash[:error] = task.errors.messages if task.errors.any?
				redirect_to list_path(params[:list_id])
			end
		end
	end

	def reschedule
		task = Task.find(params[:task_id])
		task.reschedule
		task.save(validate: false)

		respond_to do |format| 
			format.html do
				flash[:success] = 'Se actualizó la fecha de terminación de la tarea'
				redirect_to list_path(params[:list_id])
			end
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
