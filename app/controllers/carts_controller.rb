class CartsController < ApplicationController


  def show 
    @current_cart = Cart.find_by(id: params[:id])
  end

  def checkout
    @current_cart = Cart.find_by(id: params[:id])
    
    @current_cart.line_items.each do |line_item|
      item = Item.find(line_item.item_id)
      item.inventory = (item.inventory - line_item.quantity) 
      item.save
    end
    @current_cart.items.clear && @current_cart.items.clear
    @current_cart.save

    redirect_to cart_path(@current_cart)
  end
end