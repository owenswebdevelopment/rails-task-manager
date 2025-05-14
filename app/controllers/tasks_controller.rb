class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def create
    # to create the instance from the form data
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
    # else
    #   # when it doesnt save -> show the form again
    #   render 'new', status: :unprocessable_entity # throws a 422 (for Turbo)
    # end
  end

  def destroy
    # find the restaurant with the id
    @task = Task.find(params[:id])
    # then destroy
    @task.destroy
    # redirect somewhere
    redirect_to tasks_path, status: :see_other
  end

  def task_params
    # Strong params -> white listing the attributes users can give us in the form
    params.require(:task).permit(:title, :details, :completed)
  end
end
