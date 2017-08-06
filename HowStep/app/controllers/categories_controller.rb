class CategoriesController < ApplicationController
  def create
  end

  def destroy
    Category.find(params[:id]).destroy
  end

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
end
