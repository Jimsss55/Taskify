class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def update

  end

  def create 
    @task = Task.new(task_params)
    
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
      else
        format.html {render :new, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully deleted.'
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(completed: params[:completed])

    render json: {message: "Success"}
  end

  private 

  def task_params
    params.require(:task).permit(:description)
  end
end
