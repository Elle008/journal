class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_category

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @task = Task.find(params[:id])
  end

  def new
    @categories = Category.all
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
    @categories = Category.all
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
    redirect_to categories_url, notice: "Task was successfully destroyed."
  end

  private

  def set_category 
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:task, :date, :time, :status_completed, :category_id)
  end

end

