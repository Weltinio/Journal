class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = Task.where(category_id: params[:category_id])
    @category = Category.find(params[:category_id])
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def create
    @task = Task.create(task_params)
    @task.category_id = params[:category_id]
    if @task.save
        flash[:notice] = 'Task has been created.'
        redirect_to category_tasks_path
    else
        flash.now[:alert] = @task.errors.full_messages
        render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to category_tasks_path
      flash[:notice] = "Task has been updated."
    else
      flash.now[:alert] = @task.errors.full_messages
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to category_tasks_path
    flash[:alert] = 'Task has been deleted!'
  end

  private
  def task_params
    params.require(:task).permit(:body, :date, :title)
  end
end
