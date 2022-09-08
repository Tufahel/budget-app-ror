class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.where(author_id: current_user.id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = 'Category successfully created'
      redirect_to categories_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @category = Category.includes(:author).find(params[:id])
  end

  def category_params
    my_category = params.require(:category).permit(:name, :icon)
    my_category[:author] = current_user
    my_category
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = 'category was successfully deleted.'
      redirect_to categories_path
    else
      flash[:error] = 'Something went wrong'
      render :show
    end
  end
end
