class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.where.not(inventory: 0)
    @user = current_user
  end

  def show 
    @category = Category.find_by(id: params[:id])
  end
  
end
