class TasksController < ApplicationController

  before_action :assign_task

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    @task.update(edit_task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.delete
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def edit_task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def assign_task
    @task = Task.find(params[:id]) unless params[:id].nil?
  end
end
