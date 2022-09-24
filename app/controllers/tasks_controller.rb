class TasksController < ApplicationController
  def show
    @categories = Category.all
    @task = Task.find(params[:id])
  end

  def new
    @categories = Category.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_url(@task), notice: "Task was successfully created." 
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
      redirect_to task_url(@task), notice: "Task was successfully updated."
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

  def task_params
    params.require(:task).permit(:task, :date, :time, :status_completed, :category_id)
  end

end

