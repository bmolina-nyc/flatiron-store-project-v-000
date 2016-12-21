class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.where.not(inventory: 0)
    @user = current_user

    # show a users cart if a current_cart exists and has an item in it
    if @user
      if !@user.current_cart_id.nil? && Cart.find(@user.current_cart_id).items.count > 0 
        @cart = Cart.find(@user.current_cart_id)
      end
    end
  end

  def show 
    @category = Category.find_by(id: params[:id])
  end
  
end
