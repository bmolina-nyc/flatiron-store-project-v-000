class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.where.not(inventory: 0)
  end

  def show 
    @category = Category.find_by(id: params[:id])
  end
  
end
