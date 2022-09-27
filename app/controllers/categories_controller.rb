class CategoriesController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
  end

  def new
    @categories = Category.all
    @category = Category.new
  end

  def create
    @categories = Category.all
    @category = Category.new(category_params)
    

    if @category.save
      redirect_to category_url(@category), notice: "Category was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def edit
    @categories = Category.all
    @category = Category.find(params[:id])
  end


  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to category_url(@category), notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url, notice: "Category was successfully destroyed."
  end

  private

  def category_params
    params.require(:category).permit(:category_name, :user_id)
  end

end
