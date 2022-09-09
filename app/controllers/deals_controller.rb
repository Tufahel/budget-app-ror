class DealsController < ApplicationController
  def new
    @category = Category.includes(:category_deals).find(params[:category_id])
    @deal = @category.deals.new
    @categories = Category.where(author_id: current_user.id)
  end

  def create
    @category = Category.includes(:category_deals).find(params[:category_id])
    @deal = @category.deals.new(deal_params)
    if @deal.save
      CategoryDeal.create(category_id: @category.id, deal_id: @deal.id)
      flash[:success] = 'Transaction added successfully'
      redirect_to category_path(@category.id)
    else
      flash.now[:error] = 'Error: Transaction could not be added'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.includes(:category_deals).find(params[:category_id])
    @deal = @category.deals.includes(:category_deals).find(params[:id])
    @category_deal = CategoryDeal.where(category_id: @category.id, deal_id: @deal.id)
    if @deal.destroy
      flash[:success] = 'Transaction was successfully deleted.'
      redirect_to category_path(@category.id)
    else
      flash[:error] = 'Something went wrong'
      render :show
    end
  end

  def deal_params
    my_deal = params.require(:deal).permit(:name, :amount)
    my_deal[:author] = current_user
    my_deal
  end
end