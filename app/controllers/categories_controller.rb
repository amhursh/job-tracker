class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash.notice = "'#{@category.title}' category added"
      redirect_to category_path(@category)
    else
      flash.notice = "Error! '#{@category.title}' category already exists"
      redirect_to new_category_path
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    flash.notice = "#{@category.title} category successfully deleted!"

    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash.notice = "'#{@category.title}' category updated"
      redirect_to category_path(@category)
    else
      flash.notice = "Error! Must provide title for category"
      redirect_to edit_category_path(@category)
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
