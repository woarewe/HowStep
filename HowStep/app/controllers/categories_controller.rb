class CategoriesController < ApplicationController
  def create
    Category.create(category_params)
    redirect_to categories_path
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:notice] = t('controllers.categories.destroy.notice')
    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.includes(posts: [:tags]).find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
