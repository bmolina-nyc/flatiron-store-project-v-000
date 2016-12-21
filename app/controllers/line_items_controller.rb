class LineItemsController < ApplicationController

  def create
  
    user = current_user

    if user.current_cart_id.nil?
      user.current_cart = Cart.create
      user.current_cart.user_id = user.id
      user.current_cart.add_item(Item.find(params[:item_id]).id)
      user.save
      user.current_cart.save
    else user.current_cart.add_item(Item.find(params[:item_id]).id)
      user.save
      user.current_cart.save
    end
    redirect_to cart_path(user.current_cart)
  end
end
  