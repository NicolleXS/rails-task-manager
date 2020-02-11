class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def edit
    set_task
  end

  def update
    set_task
    @task.update(task_params)

    # no need for app/views/tasks/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy
    set_task
    @task.destroy

    redirect_to tasks_path
  end

private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @restaurant = Restaurant.find(params[:id])
  end
end
