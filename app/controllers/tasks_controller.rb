class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_category, except: :index

  def index
    @tasks = current_user.tasks.all.where(date: Date.today)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to [@category, @task], notice: "Task was successfully created." 
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to [@category, @task], notice: "Task was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to category_path(@category), notice: "Task was successfully destroyed."
  end

  private

  def set_category 
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:task, :date, :time, :status_completed, :category_id, :user_id)
  end

end

