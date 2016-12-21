class LineItemsController < ApplicationController

  def create
  # raise params.inspect
    user = current_user

    if user.current_cart_id.nil?
      user.current_cart = Cart.create
      user.current_cart.user_id = user.id
      line_item = user.current_cart.add_item(Item.find(params[:item_id]).id)
      user.current_cart.line_items << line_item
      user.save
    else 
      line_item = user.current_cart.add_item(Item.find(params[:item_id]).id)
      user.current_cart.line_items << line_item
      user.save
    end
    redirect_to cart_path(user.current_cart)
  end
end
  